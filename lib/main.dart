import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:solid_lints/analysis_options.yaml';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Color randomColor;

  @override
  void initState() {
    changeBackgroundColor();
    super.initState();
  }

  void changeBackgroundColor() {
    setState(() {
      randomColor =
          Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: randomColor,
        body: TextButton(
          onPressed: changeBackgroundColor,
          child: const Center(
            child: Text(
              'Hi there',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
