import 'package:flutter/material.dart';

class container1 extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
   return Center(
    child: Container(
      alignment: Alignment.bottomRight,
      color: Colors.lightGreen,
      margin: EdgeInsets.only(top: 100.0),
      child: Text(
        "container",
        ),
    ),

   );
  }
}