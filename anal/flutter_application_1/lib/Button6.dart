import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
void main()
{
  runApp(MaterialApp(
    home:MyStatefulWidget(),
  ));
}
class MyStatefulWidget extends StatefulWidget
{
  const MyStatefulWidget({super.key});
  @override
  State<MyStatefulWidget> createState()=>_MyStatefulWidgetState();

}
class _MyStatefulWidgetState extends State<MyStatefulWidget>
{
  @override
  Widget build(BuildContext context)
  {
    final ButtonStyle tyle= ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
       children: <Widget>[
        ElevatedButton(style: tyle,onPressed: null,child: const Text("Disabled"),),
        const SizedBox(height: 30),
        ElevatedButton(
          style: tyle,onPressed: (){},
          child: const Text("enabled"),
        ),
       ], 
      ),
    );
  }
}
