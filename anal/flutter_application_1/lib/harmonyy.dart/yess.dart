import 'package:flutter/material.dart';

class MyApp1 extends StatelessWidget {
  const MyApp1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData. dark(),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  void didUpdateWidget(CalculatorScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Add any necessary code to handle widget updates, e.g., resetting the state
  }

  String number1 = "";
  String operand = "";
  String number2 = "";

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: OrientationBuilder(
          builder: (context, orientation) {
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    reverse: true,
                    child: Container(
                      alignment: Alignment.bottomRight,
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        _getDisplayText(),
                        style: const TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                ),
                Wrap(
                  children: Btn.buttonValues
                      .map(
                        (value) => SizedBox(
                          width: _getButtonWidth(screenSize, value),
                          height: screenSize.width / 5,
                          child: _buildButton(value),
                        ),
                      )
                      .toList(),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  String _getDisplayText() {
    return "$number1$operand$number2".isEmpty
        ? "0"
        : "$number1$operand$number2";
  }

  double _getButtonWidth(Size screenSize, String value) {
    return value == Btn.n0 ? screenSize.width / 2 : screenSize.width / 4;
  }

  Widget _buildButton(String value) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Material(
        color: _getBtnColor(value),
        clipBehavior: Clip.hardEdge,
        shape: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white24,
          ),
          borderRadius: BorderRadius.circular(100),
        ),
        child: InkWell(
          onTap: () => _onBtnTap(value),
          child: Center(
            child: Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onBtnTap(String value) {
    if (value == Btn.negative) {
      _toggleSign();
    } else if (value == Btn.clr) {
      _clearAll();
    } else if (value == Btn.per) {
      _convertToPercentage();
    } else if (value == Btn.calculate) {
      _calculate();
    } else {
      _appendValue(value);
    }
  }

  // Add this method to toggle the sign of the current number
  void _toggleSign() {
    if (number2.isNotEmpty) {
      number2 = (double.parse(number2) * -1).toString();
    } 
   
    else if (number1.isNotEmpty) {
      number1 = (double.parse(number1) * -1).toString();
    }
    setState(() {});
  }

  void _calculate() {
    if (number1.isNotEmpty && operand.isNotEmpty && number2.isNotEmpty) {
      final double num1 = double.parse(number1);
      final double num2 = double.parse(number2);
      var result = 0.0;
      switch (operand) {
        case Btn.add:
          result = num1 + num2;
          break;
        case Btn.subtract:
          result = num1 - num2;
          break;
        case Btn.multiply:
          result = num1 * num2;
          break;
        case Btn.divide:
          result = num1 / num2;
          break;
      }
      setState(() {
        RegExp regex = RegExp(r'([.]*0)(?!.*\d)');
        number1 = result.toString().replaceAll(regex, '');
        operand = "";
        number2 = "";
      });
    }
  }

  void _convertToPercentage() {
    if (number1.isNotEmpty && operand.isNotEmpty && number2.isNotEmpty) {
      _calculate();
    }
    if (operand.isEmpty) {
      final number = double.parse(number1);
      setState(() {
        number1 = "${(number / 100)}";
        operand = "";
        number2 = "";
      });
    }
  }

  void _clearAll() {
    setState(() {
      number1 = "";
      operand = "";
      number2 = "";
    });
  }

  void _appendValue(String value) {
    if (value != Btn.dot && int.tryParse(value) == null) {
      if (operand.isNotEmpty && number2.isNotEmpty) {
        _calculate();
      }
      operand = value;
    } else if (number1.isEmpty || operand.isEmpty) {
      if (value == Btn.dot && number1.contains(Btn.dot)) return;
      if (value == Btn.dot && (number1.isEmpty || number1 == Btn.n0)) {
        value = "0.";
      }
      number1 += value;
    } else if (number2.isEmpty || operand.isNotEmpty) {
      if (value == Btn.dot && number2.contains(Btn.dot)) return;
      if (value == Btn.dot && (number2.isEmpty || number2 == Btn.n0)) {
        value = "0.";
      }
      number2 += value;
    }
    setState(() {});
  }

  Color _getBtnColor(String value) {
    return [Btn.negative, Btn.clr].contains(value)
        ? Colors.blueGrey
        : [
            Btn.per,
            Btn.multiply,
            Btn.add,
            Btn.subtract,
            Btn.divide,
            Btn.calculate,
          ].contains(value)
            ? Colors.orange
            : Colors.black87;
  }
}

class Btn {
  static const String negative = "+/-";
  static const String clr = "AC";
  static const String per = "%";
  static const String multiply = "×";
  static const String divide = "÷";
  static const String add = "+";
  static const String subtract = "-";
  static const String calculate = "=";
  static const String dot = ".";

  static const String n0 = "0";
  static const String n1 = "1";
  static const String n2 = "2";
  static const String n3 = "3";
  static const String n4 = "4";
  static const String n5 = "5";
  static const String n6 = "6";
  static const String n7 = "7";
  static const String n8 = "8";
  static const String n9 = "9";

  static const List<String> buttonValues = [
    negative,
    clr,
    per,
    multiply,
    n7,
    n8,
    n9,
    divide,
    n4,
    n5,
    n6,
    subtract,
    n1,
    n2,
    n3,
    add,
    n0,
    dot,
    calculate,
  ];
}
