import 'package:flutter/material.dart';
void main()
{
  runApp(MaterialApp(
    home: Menu(),
  ));
}
class Menu extends StatefulWidget
{
   @override
  State<StatefulWidget> createState()
  {
    return Menucs();
  }
}
String str ="Nothing Selected";
class Menucs extends State<Menu>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("menu item"),
        backgroundColor: Colors.amber,
        actions: [
          IconButton(icon:Icon (Icons.computer),onPressed: (){}),
           IconButton(icon:Icon (Icons.mobile_screen_share_rounded),onPressed: (){}),
           PopupMenuButton<String>(
            onSelected: (value) {
              setState(() {
                str=value;
              });
            },
            itemBuilder: (context){
              return{"Computer","Mobile"}.map((String e) {
                return PopupMenuItem(value:e, child:Text(e));
              }).toList();
            },
           )
        ],
      ),
      body: Center(child: Text(str,style: TextStyle(fontSize: 50),),),
    );
  }
}