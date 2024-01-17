
import 'package:flutter/material.dart';

class listview099 extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("NAME"),
      ),
      body: View(),
    );
  }
}


Widget View()
{
  return Container(
    margin: EdgeInsets.all(50),
    alignment:Alignment.center,
    child: Column(
      children: [
        Text("normal railway",
        style: TextStyle(
          fontSize: 20,
          fontFamily: "Raleway",
        )),
        Text("Bold,weight 700",
        style: TextStyle(
          fontSize: 20,
          fontFamily: "Raleway",
          fontWeight: FontWeight.w700,
        )),
        Text(
          "Italic style",
          style: TextStyle(
            fontSize: 20,
            fontFamily: "Raleway",
            fontStyle: FontStyle.italic),
          ),
          Text("Regular,weight 300",
          style: TextStyle(
            fontSize: 20,
            fontFamily: "Raleway",
            fontWeight: FontWeight.w300
          ))
        
      ],
    ),
  );
}
