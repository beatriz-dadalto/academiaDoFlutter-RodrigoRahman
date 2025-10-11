import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/app/core/notifier/default_listener_notifier.dart';
import 'package:todo_list_provider/app/core/ui/theme_extensions.dart';
import 'package:todo_list_provider/app/core/validators/validators.dart';
import 'package:todo_list_provider/app/core/widget/todo_list_field.dart';
import 'package:todo_list_provider/app/core/widget/todo_list_logo.dart';
import 'package:todo_list_provider/app/modules/auth/register/register_controller.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();
  DefaultListenerNotifier? _defaultListener;
  bool _listenerInitialized = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    _defaultListener?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Only initialize listener once
    if (!_listenerInitialized) {
      _listenerInitialized = true;

      // Dispose any existing listener first
      _defaultListener?.dispose();

      _defaultListener = DefaultListenerNotifier(
        changeNotifier: context.read<RegisterController>(),
      );

      _defaultListener!.listener(
        context: context,
        successCallback: (notifier, listenerInstance) {
          listenerInstance.dispose();
          Navigator.of(context).pop();
        },
        errorCallback: (notifier, listenerInstance) {
          // Error callback - SnackBar já é mostrado automaticamente
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Todo List',
              style: TextStyle(fontSize: 11, color: context.primaryColor),
            ),
            Text(
              'Cadastro',
              style: TextStyle(fontSize: 15, color: context.primaryColor),
            ),
          ],
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: ClipOval(
            child: Container(
              color: context.primaryColor.withAlpha(20),
              padding: const EdgeInsets.all(8),
              child: Icon(
                Icons.arrow_back_ios_outlined,
                size: 20,
                color: context.primaryColor,
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: EdgeInsets.only(
          top: 20,
          left: 0,
          right: 0,
          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        ),
        children: [
          SizedBox(
            // use a smaller fraction and cap the height so the logo doesn't
            // push fields off-screen on small devices
            height: math.min(MediaQuery.of(context).size.height * 0.18, 180),
            child: FittedBox(fit: BoxFit.fitHeight, child: TodoListLogo()),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TodoListField(
                    controller: _emailController,
                    label: 'E-mail',
                    validator: Validatorless.multiple([
                      Validatorless.required('E-mail obrigatório'),
                      Validatorless.email('E-mail inválido'),
                    ]),
                  ),
                  SizedBox(height: 20),
                  TodoListField(
                    controller: _passwordController,
                    label: 'Senha',
                    obscureText: true,
                    validator: Validatorless.multiple([
                      Validatorless.required('Senha obrigatória'),
                      Validatorless.min(
                        6,
                        'Senha deve ter pelo menos 6 caracteres',
                      ),
                    ]),
                  ),
                  SizedBox(height: 20),
                  TodoListField(
                    controller: _confirmController,
                    label: 'Confirmar senha',
                    obscureText: true,
                    validator: Validatorless.multiple([
                      Validatorless.required('Confirma Senha obrigatória'),
                      Validators.compare(
                        _passwordController,
                        'Senha diferente de confirmar senha',
                      ),
                    ]),
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: () {
                        final bool isFormValid =
                            _formKey.currentState?.validate() ?? false;
                        if (isFormValid) {
                          final email = _emailController.text;
                          final password = _passwordController.text;
                          context.read<RegisterController>().registerUser(
                            email,
                            password,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text('Salvar'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
