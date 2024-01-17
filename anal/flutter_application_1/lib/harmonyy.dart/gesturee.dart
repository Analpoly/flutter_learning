import 'package:flutter/material.dart';
void main()
{
  runApp(MaterialApp(home:Gesture()));
}
class Gesture extends StatefulWidget
{
  @override
  State<StatefulWidget> createState()
  {
    return Gesturestate();
  }
}
int x=0;
class Gesturestate extends State<Gesture>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("gesture recogniser"),
      ),
      body: Center(
        child: GestureDetector(
          child: Text("Tapped $x times",style: TextStyle(fontSize: 25),),
          onTap: (){setState(() {
            x++;});},
          
        ),
      ),
    );
  }
}