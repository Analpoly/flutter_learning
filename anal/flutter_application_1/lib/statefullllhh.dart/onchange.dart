import 'package:flutter/material.dart';
void main()
{
  runApp(fidget());
}
class fidget extends StatefulWidget
{
   @override
  State<StatefulWidget> createState()
  {
    return cs();
  }
}
class cs extends State<fidget>
{
 @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      home: Scaffold(
        appBar:AppBar(
          title: Text("stateful widget class"),
        ),
        body: text_1(),
         ),
    );
  }

String str="null";
String str1="null";
Widget text_1()
{
  return Container(
    padding: EdgeInsets.all(10),
    child: ListView(
      children: [
        TextField(
          onSubmitted: (value) => {setState(() => str = value)},
          onChanged: (value) => {setState(() => str1 = value)},
          ),
          Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(top: 10),
            child: Text("onsubmitted $str",
            style: TextStyle(color: Colors.black,fontSize: 15),
            ),
          ),
           Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(top: 10),
            child: Text("onchanged $str1",
            style: TextStyle(color: Colors.black,fontSize: 15),
            ),
          )
        
      ],
    )
  );
}
}
// setState(String Function() param0) {
// }