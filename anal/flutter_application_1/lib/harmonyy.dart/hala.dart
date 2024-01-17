import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(
    home: Flick(),
    debugShowCheckedModeBanner: false,
  ));
}
class Flick extends StatefulWidget
{
  @override
  State<StatefulWidget> createState()
  {
    return Flicked();
  }
}
class Flicked extends State<Flick>
{
  
  String number1 = "";
  String operand = "";
  String number2 = "";

  @override
  Widget build(BuildContext context)
  {

    return Scaffold(
      appBar: AppBar(title: Text("Calculator"),backgroundColor: Colors.blue),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [],
        )),
    );
  }
  
}