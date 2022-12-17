import 'package:flutter/material.dart';

import 'SecondScreen.dart';

class AnimateScreen extends StatefulWidget {
  const AnimateScreen({Key? key}) : super(key: key);

  @override
  State<AnimateScreen> createState() => _AnimateScreenState();
}

class _AnimateScreenState extends State<AnimateScreen> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => SecondScreen(),
                ));
              },
              child: Text('move to next screen')),
          Hero(
            tag: 'hero_tag',
            child: Image.asset('assets/images/people.png'),
          ),
          InkWell(
            onTap: () {
              isExpanded = !isExpanded;
              setState(() {});
            },
            child: AnimatedContainer(
              duration: const Duration(
                milliseconds: 500,
              ),
              height: isExpanded ? 300 : 100,
              width: 100,
              color: isExpanded ? Colors.blue : Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
