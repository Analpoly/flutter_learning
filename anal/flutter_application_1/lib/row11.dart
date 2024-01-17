import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(
    home:raw2(),
  ));
}
class raw2 extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Container(
      child: Row(
        children: [
          Text("raw 1"),
          Text("raw 2"),
        ],
      ),
      );
    
  }
}