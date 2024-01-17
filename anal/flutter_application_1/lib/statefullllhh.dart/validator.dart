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
        body: wi(),

         ),
    );
  }
  TextEditingController cnt = TextEditingController();
//  texteditingcontroller cnt = texteditingcontroller();
Widget wi()
{
  return Container(
    padding: EdgeInsets.all(10),
    alignment: Alignment.center,
    child: TextFormField(
      controller: cnt,
      onChanged: (value) => {setState(() {})},
      decoration: InputDecoration(errorText: Validate(cnt.text)),
    )
  );
}
String? Validate(String str)
{
  if(str.isEmpty)
  {
    return "field is empty";
  }
  return null;
}
}
