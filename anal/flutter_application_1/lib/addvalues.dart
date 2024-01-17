

import 'package:flutter/material.dart';
void main()
{
  runApp(MaterialApp(
    home:listview08(),
  ));
}
class listview08 extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adding values"),
      ),
      body: View());
  }
  List getelements(){
  List li = List.generate(100, (index)=> "Item is ${index}");
  return li;
  }
  Widget View()
  {
    var items=getelements();
    var li=ListView.builder(itemBuilder: (context,index){
    return ListTile(
      leading: Icon(Icons.arrow_right),
      title: Text(items[index]),
    );
      
 } );
 return li;
  }
}