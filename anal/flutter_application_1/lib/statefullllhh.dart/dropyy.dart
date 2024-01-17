import 'package:flutter/material.dart';
// import 'package:flutter_application_1/statefullllhh.dart/practise.dart';
void main()
{
  runApp(explcit());
}
class explcit extends StatefulWidget
{
  @override
  State<StatefulWidget> createState()
  {
    return workshop2();
  }
}
var li=["abcd","efgh","ijkl","hjehfj"];
String str=li[0];
class workshop2 extends State<explcit>
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      home: Scaffold(
        appBar:AppBar(
          title: Text("dropdownbutton"),
        ),
        body: dro()),
    );
  }
  Widget dro()
  {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(20),
      child: DropdownButton(
        items: li 
        .map((e) => DropdownMenuItem(value:e, child:Text(e)))
        .toList(),
        value: str,
        onChanged: (value)=> {setState(()=> str = value!)},
    ));
  }
}