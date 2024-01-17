import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(
    home:listview07(),
  ));
}
class listview07 extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body:li(),

    );
  }

  Widget li()
  {
    var list = ListView(
      children: [
        ListTile(
          leading: Icon(Icons.landscape),
          title: Text("1st item"),
          subtitle: Text("1st item's description"),
          trailing: Icon(Icons.wb_sunny),
        ),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text("2nd item"),
          subtitle: Text("2nd item description"),
          trailing: Icon(Icons.account_box),
        ),
        ListTile(
          leading: Icon(Icons.laptop),
          title: Text("3rd item"),
          subtitle: Text("3rd item description"),
          trailing: Icon(Icons.mobile_screen_share),
        ),
      ],
    );
    return list;
  }
}