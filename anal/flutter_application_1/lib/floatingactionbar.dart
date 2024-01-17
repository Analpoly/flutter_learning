// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
void main()
{
  runApp(MaterialApp(
    home:Snakbar8(),
  ));
}
class Snakbar8 extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("Snackbar"),
      ),
      body: li(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(Icons.add),
        tooltip: "addlist",
        onPressed: () => {debugPrint("floating button clicked")}));
  }

void showSnackBar(BuildContext context,String item)
{
  var c = SnackBar(
    content: Text("you just tapped $item"),
    action: SnackBarAction(
      label:"UNDO", onPressed: () => {debugPrint("undo clicked")}),
    );
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("data") ));
}

}
 Widget li()
  {
    var list = ListView(
      children: [
        ListTile(
          leading: Icon(Icons.landscape),
          title: Text("1st item"),
          subtitle: Text("1st item's description"),
          trailing: Icon(Icons.wb_sunny),
          
        ),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text("2nd item"),
          subtitle: Text("2nd item description"),
          trailing: Icon(Icons.account_box),
        ),
        ListTile(
          leading: Icon(Icons.laptop),
          title: Text("3rd item"),
          subtitle: Text("3rd item description"),
          trailing: Icon(Icons.mobile_screen_share),
        ),
      ],
    );
    return list;
  }

  
// List <String> getelements(){
//   var li = List<String>.generate(100, (counter)=> "Item is ${counter}");
//   return items;
//   }
//   Widget li()
//   {
//     var items=getelements();
//     var li=ListView.builder(itemBuilder: (context,index){
//     return ListTile(
//       leading: Icon(Icons.arrow_right),
//       title: Text(items[index]),
//       onTap: (){
//         (context,items[index]);
//       },
//     );
      
//  } );
//  return li;
//   }
  
