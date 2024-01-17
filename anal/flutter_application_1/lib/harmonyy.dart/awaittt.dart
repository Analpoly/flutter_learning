import 'package:flutter/material.dart';
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
String x="Has\"nt started";
String y = "Has\"nt started";
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
            ElevatedButton(onPressed: (){return_x();},
            child: Text("First function"),),
            Text(x,style: TextStyle(fontSize: 25),),
            Container(margin: EdgeInsets.all(30),),
             ElevatedButton(onPressed: (){return_y();},
            child: Text("Second function"),),
            Text(y,style: TextStyle(fontSize: 25),),
          ],
        ),
      ),
    );
  }
  void return_x() async{
    for(int i=0; i<=100;i++)
    {
      setState(() {
        x="First thread, "+i.toString()+"times";
      });
      await Future.delayed(Duration(seconds: 1));
    }
  }
  void return_y() async{
    for(int i=0; i<=100;i++)
    {
      setState(() {
        y="Second thread, "+i.toString()+"times";
      });
      await Future.delayed(Duration(seconds: 1));
    }
  }
}