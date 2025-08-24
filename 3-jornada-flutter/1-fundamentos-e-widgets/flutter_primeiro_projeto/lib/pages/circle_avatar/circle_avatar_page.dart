import 'package:flutter/material.dart';

class CircleAvatarPage extends StatelessWidget {
  const CircleAvatarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Circle Avatar'),
      ),
      body: const Row(
        children: [
          ImageAvatarCustom(
            urlImage:
                'https://image.similarpng.com/file/similarpng/very-thumbnail/2021/07/Rock-n-roll-hand-on-transparent-background-PNG.png',
          ),
          SizedBox(
            width: 8.0,
          ),
          ImageAvatarCustom(
            urlImage:
                'https://img.favpng.com/4/9/8/the-rolling-stones-logo-musical-ensemble-it-s-only-rock-n-roll-png-favpng-XuTKSnGrHptFF0ujN60P76FuK.jpg',
          ),
        ],
      ),
    );
  }
}

class ImageAvatarCustom extends StatelessWidget {
  final String urlImage;

  const ImageAvatarCustom({super.key, required this.urlImage});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 100.0,
          height: 100.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.0),
            gradient: const LinearGradient(
              colors: [
                Colors.amber,
                Colors.black,
              ],
              begin: Alignment.topCenter,
            ),
          ),
        ),
        Container(
          width: 100.0,
          height: 100.0,
          padding: const EdgeInsets.all(5.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(urlImage),
          ),
        ),
        Container(
          width: 100.0,
          height: 100.0,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 4.0,
                horizontal: 6.0,
              ),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: const Text(
                'AO VIVO',
                style: TextStyle(fontSize: 10.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
