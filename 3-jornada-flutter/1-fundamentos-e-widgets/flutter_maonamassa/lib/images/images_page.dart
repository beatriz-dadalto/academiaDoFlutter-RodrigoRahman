import 'package:flutter/material.dart';

class ImagesPage extends StatelessWidget {
  const ImagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // print(MediaQuery.of(context).devicePixelRatio);
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: const Text(
          'Images',
        ),
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              'Academia do Flutter',
              style: TextStyle(
                fontFamily: 'Tourney',
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            Container(
              width: 250,
              height: 250,
              decoration: const BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage('assets/images/moto.jpg'),
                  fit: BoxFit.contain,
                ),
              ),
              child: Center(
                child: Text(
                  'Quero uma moto!',
                  style: TextStyle(
                      backgroundColor: Colors.amber.withOpacity(0.9),
                      fontSize: 20),
                ),
              ),
            ),
            Container(
              color: Colors.black,
              width: 250,
              height: 250,
              child: Image.network(
                'https://www.pngall.com/wp-content/uploads/13/Harley-Davidson-Logo-PNG-180x180.png',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
