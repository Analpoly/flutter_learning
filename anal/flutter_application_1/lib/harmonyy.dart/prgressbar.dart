import 'package:flutter/material.dart';
// import 'package:flutter_application_1/harmonyy.dart/gesturee.dart';
void main()
{
  runApp(MaterialApp(home: Syn(),));
}
class  Syn extends StatefulWidget
{
  State<StatefulWidget> createState()
  {
    return Syn_cs();
  }
}
double x=0.0;

class Syn_cs extends State<Syn>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("Await and asynching"),
      ),
      body: Container(
        margin: EdgeInsets.all(30),child: ListView(
          children: [
Row(children:[
  Expanded(child: Container(child: Text("Circular progress",style: TextStyle(fontSize: 18),),)),
  Expanded(child: Center(child: CircularProgressIndicator(),))
],),
Row(children:[
  Expanded(child: Container(child: Text("Linear progress",style: TextStyle(fontSize: 18),),)),
  Expanded(child: Center(child: LinearProgressIndicator(),))
],),
Row(children:[
  Expanded(child: Container(child: Text("Circular progress with background color red",style: TextStyle(fontSize: 12),),)),
  Expanded(child: Center(child: CircularProgressIndicator(backgroundColor: Colors.red,),))
],),
Row(children:[
  Expanded(child: Container(child: Text("Linear progress with background red",style: TextStyle(fontSize: 12),),)),
  Expanded(child: Center(child: LinearProgressIndicator(backgroundColor: Colors.red,),))
],),
ElevatedButton(onPressed:(){increment();},child:Text("Start with custom value"),),
Row(children:[
  Expanded(child: Text("Circular progress with custom value",style: TextStyle(fontSize: 12),)),
  Expanded(child: Center(child: CircularProgressIndicator(value: x,),)),
  Expanded(child: Center(child: Text("$x"),))
]),
Row(children:[
  Expanded(child: Text("Circular progress with custom value",style: TextStyle(fontSize: 12),)),
  Expanded(child: Center(child: LinearProgressIndicator(value: x,),)),
  Expanded(child: Center(child: Text("$x"),))
],),
],),
));
}
void increment() async
{
  for(double i=1;i<=10;i++)
  {
    setState(
      (){x=x+0.1;}
    );
    await Future.delayed(Duration(seconds: 1));
  }
}
}