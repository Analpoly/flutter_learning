import 'package:flutter/material.dart';
// import 'package:flutter_application_1/statefullllhh.dart/jfbhhfh.dart';
void main()
{
  runApp(MaterialApp(
    home: Master(),
  ));
}
class Master extends StatefulWidget
{
   @override
  State<StatefulWidget> createState()
  {
    return Master_cs();
  }
}
String str ="Main Page";
class Master_cs extends State<Master>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
         appBar: AppBar(title: Text("navigation drawer"), backgroundColor: Colors.green,),
          body: Container(
            child: Text(str,style: TextStyle(fontSize: 50),),
            
            ),
        drawer: Drawer(
          
          child: returnw(),
          elevation: 20,
        ),
      //  body: Container(), 
      );
    
  }
  
  
  returnw() {
  ElevatedButton(
     child: Text("button 1"), 
     onPressed: () {
       
     },
    );
  }
}