import 'dart:async';
// import 'dart:js';

import 'package:flutter/material.dart';
void main()
{
  runApp(MaterialApp(
    home: Main(),
  ));
}
class Main extends StatefulWidget
{
   @override
  State<StatefulWidget> createState()
  {
    return _MainState();
  }
}
class _MainState extends State<Main>
{
  @override
 void initState()
 {
  Timer(
    Duration(seconds: 3),
    ()=> Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => SecondScreen())));
 }
 @override
 Widget build(BuildContext context)
 {
  return Container(
    color: Colors.white,
    child: FlutterLogo(size: MediaQuery.of(context).size.height),
  );
 }
}
class SecondScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(title:Text("geeksforgeeks")),
      body: Center(
        child: Text(
          "home page",
          textScaleFactor: 2,
        )
      ),
    );
  }
}