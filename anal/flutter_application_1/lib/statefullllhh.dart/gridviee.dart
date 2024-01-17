import 'package:flutter/material.dart';
// import 'package:flutter_application_1/statefullllhh.dart/builderfunction.dart';
void main()
{
  runApp(MaterialApp(
    home: Main()
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
  List<String> veggies =["brocolli","carrot","Cucumber"];
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 8),
           itemBuilder: (context,index)
           {
            var xIndex = index % 8;
            var yIndex = (index/8).floor();
            return Container(
              color: (xIndex+yIndex).isEven ? Colors.black: Colors.white,
              child: Stack(
                children: <Widget>[],
               ),
            );
           }),
           )
    );
  }
}