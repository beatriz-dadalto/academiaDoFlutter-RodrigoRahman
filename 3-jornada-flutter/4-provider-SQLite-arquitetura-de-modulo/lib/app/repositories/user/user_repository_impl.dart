import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:todo_list_provider/app/exceptions/auth_exception.dart';
import 'package:todo_list_provider/app/repositories/user/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final FirebaseAuth _firebaseAuth;

  UserRepositoryImpl({required FirebaseAuth firebaseAuth})
    : _firebaseAuth = firebaseAuth;

  @override
  Future<User?> register(String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw AuthException(
          message: 'E-mail já utilizado, por favor escolha outro e-mail',
        );
      } else {
        throw AuthException(message: e.message ?? 'Erro ao registrar usuário');
      }
    } catch (e, s) {
      log('Unexpected error during registration', error: e, stackTrace: s);

      // Check if user was actually created despite the pigeon decode error
      final currentUser = _firebaseAuth.currentUser;
      if (currentUser != null && currentUser.email == email) {
        // User was created successfully, return the user despite the platform error
        log(
          'User was created successfully despite platform error',
          name: 'UserRepository',
        );
        return currentUser;
      }

      // If no user was created, throw the original error
      throw AuthException(message: 'Erro ao registrar usuário: $e');
    }
  }

  @override
  Future<User?> login(String email, String password) async {
    try {
      final userCredentials = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredentials.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        throw AuthException(message: 'Login ou senha inválidos');
      } else if (e.code == 'user-not-found') {
        throw AuthException(message: 'Usuário não encontrado');
      } else if (e.code == 'wrong-password') {
        throw AuthException(message: 'Senha incorreta');
      } else {
        throw AuthException(message: e.message ?? 'Erro ao realizar login');
      }
    } catch (e, s) {
      log('Unexpected error during login', error: e, stackTrace: s);

      // Check if user was actually logged in despite the pigeon decode error
      final currentUser = _firebaseAuth.currentUser;
      if (currentUser != null && currentUser.email == email) {
        // User was logged in successfully, return the user despite the platform error
        log(
          'User was logged in successfully despite platform error',
          name: 'UserRepository',
        );
        return currentUser;
      }

      // If no user was logged in, throw the original error
      throw AuthException(message: 'Erro ao realizar login: $e');
    }
  }

  @override
  Future<void> forgotPassword(String email) async {
    try {
      // ✅ Envia email de recuperação diretamente
      await _firebaseAuth.sendPasswordResetEmail(email: email);

      // Firebase NÃO lança erro se o email não existir (por segurança)
      // Apenas envia o email se a conta existir
    } on FirebaseAuthException catch (e) {
      // Trata erros específicos
      switch (e.code) {
        case 'invalid-email':
          throw AuthException(message: 'E-mail inválido');
        case 'user-not-found':
          // Nota: Este erro raramente é retornado por questões de segurança
          // Firebase prefere não confirmar se o email existe ou não
          throw AuthException(message: 'Usuário não encontrado');
        default:
          throw AuthException(
            message: 'Erro ao enviar email de recuperação: ${e.message}',
          );
      }
    } on Exception catch (e) {
      throw AuthException(
        message: 'Erro inesperado ao enviar email de recuperação',
      );
    }
  }

  @override
  Future<User?> googleLogin() async {
    List<String>? loginMethods;

    try {
      final googleSingIn = GoogleSignIn();
      final googleUser = await googleSingIn.signIn();
      if (googleUser != null) {
        final loginMethods = await _firebaseAuth.fetchSignInMethodsForEmail(
          googleUser.email,
        );

        if (loginMethods.contains('password')) {
          throw AuthException(
            message:
                'Você utilizou um e-mail para cadastro, você pode clicar em recuperar sua senha caso tenha esquecido',
          );
        } else {
          final googleAuth = await googleUser.authentication;
          final firebaseCredential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken,
            idToken: googleAuth.idToken,
          );

          var userCredential = await _firebaseAuth.signInWithCredential(
            firebaseCredential,
          );

          return userCredential.user;
        }
      }
    } on FirebaseAuthException catch (e, s) {
      print(e);
      print(s);
      if (e.code == 'account-exists-with-different-credential') {
        throw AuthException(
          message:
              '''Login inválido! Você se registrou com os seguintes provedores:
              ${loginMethods!.join(',')}''',
        );
      } else {
        throw AuthException(message: 'Erro ao realizar login');
      }
    }
    return null;
  }

  @override
  Future<void> logout() async {
    await GoogleSignIn().signOut();
    _firebaseAuth.signOut();
  }
}
