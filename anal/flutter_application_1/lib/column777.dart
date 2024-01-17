import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(
    home:container3(),
  ));
}
class container3 extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Container(
      margin: EdgeInsets.only(top: 40),
      color: Colors.amber,
      child: Column(children: [
        Text("column 1"),
        Text("column 2"),
        Text("column 3"),
        Text("column 4"),
        Text("column 5"),
      ],
      ),
    );
  }
}