import 'package:flutter/material.dart';
import 'package:workshop1/FirstPage.dart';
import 'package:workshop1/pages/AnimateScreen.dart';

import 'AiScreen.dart';
import 'SecondPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(child: AnimateScreen()),
    );
  }
}
