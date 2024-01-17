import 'package:flutter/material.dart';

class SimpleInterestCalculator extends StatelessWidget {
  final TextEditingController principalController = TextEditingController();
  final TextEditingController rateController = TextEditingController();
  final TextEditingController termController = TextEditingController();
  final TextEditingController interestController = TextEditingController();

  void calculateInterest() {
    double principal = double.parse(principalController.text);
    double rate = double.parse(rateController.text);
    double term = double.parse(termController.text);
    double interest = (principal * rate * term) / 100;

    interestController.text = interest.toString();
  }

  void reset() {
    principalController.text = '';
    rateController.text = '';
    termController.text = '';
    interestController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Interest Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: principalController,
              decoration: InputDecoration(
                labelText: 'Principal',
              ),
            ),
            TextField(
              controller: rateController,
              decoration: InputDecoration(
                labelText: 'Rate of Interest',
              ),
            ),
            TextField(
              controller: termController,
              decoration: InputDecoration(
                labelText: 'Term',
              ),
            ),
            TextField(
              controller: interestController,
              enabled: false,
              decoration: InputDecoration(
                labelText: 'Interest',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: calculateInterest,
                  child: Text('Calculate'),
                ),
                TextButton(
                  onPressed: reset,
                  child: Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
