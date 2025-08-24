import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {

  const Page2({ super.key });

   @override
   Widget build(BuildContext context) {
       // nao precisa de scaffold porque essa pagina será inserida dentro do scaffold da pagina pai
       return Container(
        color: Colors.blue,
       );
  }
}
