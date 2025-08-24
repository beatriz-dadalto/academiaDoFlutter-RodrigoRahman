import 'package:flutter/material.dart';

class FormsPage extends StatefulWidget {
  const FormsPage({super.key});

  @override
  State<FormsPage> createState() => _FormsPageState();
}

class _FormsPageState extends State<FormsPage> {
  String text = "";
  final formKey = GlobalKey<FormState>();
  final controllerFieldName = TextEditingController();
  final controllerFieldPassword = TextEditingController();
  final focusNode = FocusNode();
  var category = 'Categoria1';

  @override
  void dispose() {
    controllerFieldName.dispose();
    controllerFieldPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forms Page'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  onChanged: (value) {
                    setState(() {
                      text = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Text('Texto digitado no TextField: $text'),
                const SizedBox(
                  height: 32.0,
                ),
                const Text('TextFormField com validação'),
                const SizedBox(
                  height: 12.0,
                ),
                TextFormField(
                  controller: controllerFieldName,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    isDense: true,
                    labelText: 'Nome Completo',
                    labelStyle: const TextStyle(
                      color: Colors.green,
                      fontSize: 24.0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(color: Colors.teal),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(color: Colors.teal),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(color: Colors.teal),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                  ),
                  maxLines: null,
                  focusNode: focusNode,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo de nome não foi preenchido';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: controllerFieldPassword,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  obscureText: true,
                  decoration: InputDecoration(
                    isDense: true,
                    labelText: 'Senha',
                    labelStyle: const TextStyle(
                      color: Colors.green,
                      fontSize: 24.0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(color: Colors.teal),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(color: Colors.teal),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(color: Colors.teal),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                  ),
                  maxLines: 1,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo de senha não foi preenchido';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20.0,),
                DropdownButtonFormField<String>(
                  value: category,
                  elevation: 16,
                  isDense: true,
                  icon: const Icon(Icons.arrow_back_ios),
                  decoration: InputDecoration(
                    labelText: 'Categoria',
                    labelStyle: const TextStyle(
                      color: Colors.green,
                      fontSize: 24.0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(color: Colors.teal),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(color: Colors.teal),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(color: Colors.teal),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                  ),
                  validator: (String? value) {
                    if (value != null) {
                      setState(() {
                        category = value;
                      });
                    }
                    return null;
                  },
                  onChanged: (String? value) {},
                  items: const [
                    DropdownMenuItem(
                      value: 'Categoria1',
                      child: Text('Categoria 1'),
                    ),
                    DropdownMenuItem(
                      value: 'Categoria2',
                      child: Text('Categoria 2'),
                    ),
                    DropdownMenuItem(
                      value: 'Categoria3',
                      child: Text('Categoria 3'),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    var formIsValid = formKey.currentState?.validate() ?? false;
                    var message = 'Formulário inválido';
                    if (formIsValid) {
                      message =
                          'Formulário válido! Name: ${controllerFieldName.text} e categoria: $category';
                    }
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(
                      SnackBar(
                        content: Text(message),
                      ),
                    );
                  },
                  child: const Text("Salvar"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
