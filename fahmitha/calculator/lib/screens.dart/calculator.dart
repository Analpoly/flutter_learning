import 'package:calculator/components.dart/display.dart';
import 'package:calculator/models.dart/memory.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../components.dart/keyboard.dart';


class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<StatefulWidget> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final Memory memory = Memory();

  _onPressed(String command) {
    setState(() {
      memory.applyCommand(command);
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Column(
        children: [
          Display(
            text: memory.value,
          ),
          Keyboard(
            onPressed: _onPressed,
          ),
        ],
      ),
    );
  }
}