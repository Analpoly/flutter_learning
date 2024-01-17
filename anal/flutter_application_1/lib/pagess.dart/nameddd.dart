// import 'dart:js';

import 'package:flutter/material.dart';
// import 'package:flutter_application_1/statefullllhh.dart/builderfunction.dart';
// import 'package:flutter_application_1/statefullllhh.dart/splash.dart';

void main(List<String> args)
{
  runApp(
    MaterialApp(
      title: "vasu",
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: "/",
      routes: {
        "/":(context) => Main(),
        "/second":(context) => SecondScreen(),
      },
    )
  );
}
class Main extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          // onPressed: onPressed,
           child: Text("click here"),
           onPressed: () {
             Navigator.pushNamed(context, "/second");
           },),
      ),
    );
  }
}
class SecondScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Navigator.pop(context,"/second");
          } ,
          child: Text("clickhghghj here")),
      ),
    );
  }
}