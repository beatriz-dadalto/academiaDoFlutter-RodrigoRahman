import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {

  const Page1({ super.key });

   @override
   Widget build(BuildContext context) {
       // nao precisa de scaffold porque essa pagina será inserida dentro do scaffold da pagina pai
       return Container(
        color: Colors.red,
       );
  }
}
