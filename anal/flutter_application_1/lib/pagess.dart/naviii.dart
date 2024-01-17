import 'package:flutter/material.dart';
// import 'package:flutter_launcher_icons/xml_templates.dart';

void main()
{
  runApp(MaterialApp(
    home: page1(),
  ));
}
class page1 extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(title: Text("page1"),),
      body: Center(
       child: ElevatedButton(
        child: Text('navigate',style: TextStyle(fontSize: 50),),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>page2()));
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreen,
               ),
),
        
       ),
         );
      
    
  }
}
class page2 extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(title: Text("page 2"),),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.yellow,
          ),
           child: Text("go back", style: TextStyle(fontSize: 50),),),
      ),
    );
  }
}