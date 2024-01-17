import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(home: Monna(),));
}
class Monna extends StatefulWidget
{
  @override
  State<StatefulWidget> createState()
  {
    return Fami();
  }
}
class Fami extends State<Monna>
{
  @override
  Widget build(BuildContext context)
  {
    return Center(
      child:ElevatedButton(
      onPressed: ((){
        setState(() {
          showDialog(context: context, 
          builder: (context)
          {
            return AlertDialog(title: Text("yay! .... you clicked me"),);
          },);
        });
      }
      ), child: Text("click me"),
    ));
  }
}