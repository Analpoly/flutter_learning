import 'package:flutter/material.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatefulWidget 
{
  @override
  State<StatefulWidget> createState()
  {
    return cs();
  }
}
class cs extends State<MyApp>
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      home: Scaffold(
        appBar:AppBar(
          title: Text("stateful widget class"),
        ),
        body: wi(),
         ),
    );
  }
  Widget wi()
  {
    return Center(
      child: Text("structure of stateful widget class"),
    );
  }
}