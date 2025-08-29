import 'package:flutter/material.dart';
import 'package:flutter_provider_example/provider/produto_model.dart';
import 'package:flutter_provider_example/provider/produto_widget.dart';
import 'package:flutter_provider_example/provider/user_model.dart';
import 'package:provider/provider.dart';

class ProviderPage extends StatelessWidget {
  const ProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserModel>(context);
    // diferenca entre Provider.of e .read() -> read retorna uma instancia sem ficar escutando alteracoes
    //var user = context.read<UserModel>();
    // desestruturacao, extrair um obj
    /*var imageAvatar = context.select<UserModel, String>(
      (userModel) => userModel.imgAvatar,
    );*/
    //var user1 = context.watch<UserModel>();

    return Provider(
      create: (_) => ProdutoModel(nome: 'Cantora da música Please, Please!'),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Provider'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(user.imgAvatar),
                  radius: 60,
                ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(user.name),
                    Text(' (${user.birthDate})'),
                  ],
                ),
                ProdutoWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
