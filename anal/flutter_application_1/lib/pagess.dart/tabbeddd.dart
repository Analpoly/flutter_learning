// import 'package:flutter/material.dart';
// void main()
// {
//   runApp(MaterialApp(home:Tab(),));
// }
// class Tab extends StatefulWidget
// {
//    @override
//   State<StatefulWidget> createState()
//   {
//     return Tabs();
//   }
// }
// class Tabs extends State<Tab> with TickerProviderStateMixin
// {
  
//      late TabController cn;
//   int tab = 0;
//   @override
//   void initState() {
//     super.initState();cn = TabController(length: 2, vsync: this);
  
//   }
 

//   @override
//   Widget build(BuildContext context)
//   {
//     return Scaffold(
//       appBar: AppBar(title: Text("home page"),
//       bottom:  TabBar(
//         tabs: [
//           Tab(icon:  Icon(Icons.pages),label:"one")
//         ]),),
//       body: TabBarView(controller: cn,children: [
//         Container(
//           color: Colors.lightGreen,child: Center(
//             child: Text("page 1", style: TextStyle(fontSize: 50),),
//           ),
//         ),
//         Container(
//           color: Colors.lime,child: Center(
//             child: Text("page 2",style: TextStyle(fontSize: 50),),
//           ),
//         ),
//       ]),
//       bottomNavigationBar: BottomNavigationBar(
//         onTap: (value) {
//           cn.animateTo(value);
//           setState(() {
//             tab=value;
//           });
//         },
//         currentIndex: tab,
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.pages),label:"one"),
//           BottomNavigationBarItem(icon: Icon(Icons.pages),label:"two")
//         ],),
//     );
//   }
// }