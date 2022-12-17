import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Hero(
              tag: 'hero_tag',
              child: Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/4/47/PNG_transparency_demonstration_1.png',
                height: 500,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
          )
        ],
      ),
    );
  }
}
