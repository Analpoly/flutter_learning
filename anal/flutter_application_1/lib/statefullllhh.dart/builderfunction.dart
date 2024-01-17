import 'package:flutter/material.dart';
void main()
{
  runApp(MaterialApp(
    home: Main(),
  ));
}
class Main extends StatefulWidget
{
   @override
  State<StatefulWidget> createState()
  {
    return _MainState();
  }
}
class _MainState extends State<Main>
{
  List<String> veggies =["brocoli","carrot","cucumber"];
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
      body: ListView.builder(
        itemCount: veggies.length,
        itemBuilder: (context,int index) => Text(veggies[index]),
        ),
    );
  }
}