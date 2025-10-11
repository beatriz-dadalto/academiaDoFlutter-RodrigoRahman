import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
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
}
