import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color? _backgroundColor ;
  Color? _textColor ;

  void _changeBackgroundColor() {
    setState(() {
      final color = Color.fromARGB(
        255,
        Random().nextInt(256),
        Random().nextInt(256),
        Random().nextInt(256),
      );
      _backgroundColor = color;
      // Check the luminance of the color and set the text color accordingly
      _textColor = color.computeLuminance() > 0.5 ? Colors.black : Colors.white;
    });
  }

  @override
  void initState() {
    super.initState();
    _changeBackgroundColor();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _changeBackgroundColor,
      child: Scaffold(
        backgroundColor: _backgroundColor,
        body: Center(
          child: Text(
            'Hey there',
            style: TextStyle(fontSize: 24.0, color: _textColor),
          ),
        ),
      ),
    );
  }
}
