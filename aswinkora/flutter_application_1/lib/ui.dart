import 'package:flutter/material.dart';

class myapp extends StatefulWidget {
  const myapp({super.key});

  @override
  State<StatefulWidget> createState() {
    return calculatorApp();
  }
}

class calculatorApp extends State<myapp> {
  var num1 = '';
  var op = '';
  var num2 = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        bottom: false,
        child: Column(children: [
          Expanded(
              child: SingleChildScrollView(
            reverse: true,
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(30),
              child: Text(
                '$num1$op$num2'.isEmpty ? '0' : '$num1$op$num2',
                style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              btn('Ac', const Color.fromARGB(255, 215, 214, 213),
                  const Color.fromARGB(255, 12, 12, 12)),
              btn('+/-', const Color.fromARGB(255, 215, 214, 213),
                  const Color.fromARGB(255, 11, 11, 11)),
              btn('%', const Color.fromARGB(255, 215, 214, 213),
                  const Color.fromARGB(255, 11, 11, 11)),
              btn('/', Colors.orange.shade700, Colors.white),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              btn('7', Colors.grey.shade700, Colors.white),
              btn('8', Colors.grey.shade700, Colors.white),
              btn('9', Colors.grey.shade700, Colors.white),
              btn('x', Colors.orange.shade700, Colors.white),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              btn('3', Colors.grey.shade700, Colors.white),
              btn('4', Colors.grey.shade700, Colors.white),
              btn('6', Colors.grey.shade700, Colors.white),
              btn('-', Colors.orange.shade700, Colors.white),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              btn('1', Colors.grey.shade700, Colors.white),
              btn('2', Colors.grey.shade700, Colors.white),
              btn('3', Colors.grey.shade700, Colors.white),
              btn('+', Colors.orange.shade700, Colors.white),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              btn0('0', Colors.grey.shade700, Colors.white),
              btn('.', Colors.grey.shade700, Colors.white),
              btn('=', Colors.orange.shade700, Colors.white),
            ],
          ),
          const SizedBox(
            height: 10,
          )
        ]),
      ),
    );
  }

  Widget btn(
    btntext,
    btncolor,
    textcolor,
  ) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 4,
      height: MediaQuery.of(context).size.height / 9,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: btncolor, shape: const CircleBorder()),
          onPressed: () {
            onbuttonpress(btntext);
          },
          child: Center(
            child: Text(
              btntext,
              style: TextStyle(
                color: textcolor,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget btn0(btntext, btncolor, textcolor) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.height / 9,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: btncolor),
          onPressed: () {
            onbuttonpress(btntext);
          },
          child: Center(
            child: Text(
              btntext,
              style: TextStyle(
                color: textcolor,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onbuttonpress(btntext) {
    setState(() {
      if (btntext == 'Ac') {
        clear();
        return;
      } else if (btntext == '%') {
        percentage();
        return;
      } else if (btntext == '+/-') {
        toggle();
        return;
      } else if (btntext == '=') {
        return equal();
      }
      format(btntext);
    });
  }

  void clear() {
    setState(() {
      num1 = '';
      op = '';
      num2 = '';
    });
  }

  void percentage() {
    if (num1.isNotEmpty && op.isNotEmpty && num2.isNotEmpty) {
      equal();
    }

    if (op.isNotEmpty) {
      return;
    }

    final number = double.parse(num1);
    setState(() {
      num1 = "${(number / 100)}";
      op = "";
      num2 = "";
    });
  }

  void toggle() {
    setState(() {
      if (op.isEmpty) {
        num1 = (double.parse(num1) * -1).toString();
      } else {
        num2 = (double.parse(num2) * -1).toString();
      }
    });
  }

  void equal() {
    var res = 0.0;
    switch (op) {
      case '+':
        res = double.parse(num1) + double.parse(num2);
      case '-':
        res = double.parse(num1) - double.parse(num2);
      case 'x':
        res = double.parse(num1) * double.parse(num2);
      case '/':
        res = double.parse(num1) / double.parse(num2);
    }
    setState(() {
      if (num1.isEmpty) return;
      if (op.isEmpty) return;
      if (num2.isEmpty) return;
      num1 = res.toString();
      if (num1.endsWith(".0")) {
        num1 = num1.substring(0, num1.length - 2);
      }
      op = '';
      num2 = '';
    });
  }

  void format(btntext) {
    if (btntext != '.' && int.tryParse(btntext) == null) {
      if (op.isNotEmpty && num2.isNotEmpty) {
        equal();
      }
      op = btntext;
    } else if (num1.isEmpty || op.isEmpty) {
      if (btntext == '.' && num1.contains('.')) return;
      if (btntext == '.' && (num1.isEmpty || num1 == '.')) {
        btntext = "0.";
      }
      num1 += btntext;
    } else if (num2.isEmpty || op.isNotEmpty) {
      if (btntext == '.' && num2.contains('.')) return;
      if (btntext == '.' && (num2.isEmpty || num2 == '.')) {
        btntext = "0.";
      }
      num2 += btntext;
    }
    setState(() {});
  }
}
