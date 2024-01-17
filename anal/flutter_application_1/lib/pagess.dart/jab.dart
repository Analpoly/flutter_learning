// import 'package:flutter/material.dart';

// // import 'package:flutter_application_1/statefullllhh.dart/jfbhhfh.dart';
// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "Drawer tutorial",
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const HomeScreen(title: "Home"),
//     );
//   }
// }

// class NavDrawer extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width * 0.50,
//       child: Drawer(
//         child: Container(
//           color: Colors.blue,
//           child: ListView(
//             children: <Widget>[
//               DrawerHeader(
//                 child: Text('Drawer Header'),
//                 padding: EdgeInsets.all(3.0),
//                 decoration: BoxDecoration(
//                     color: Colors.blue,
//                     image: DecorationImage(
//                         image: AssetImage("assets/dojob.jpg"),
//                         fit: BoxFit.cover)),
//               ),
//               ListTile(
//                 title: Text("Home"),
//                 textColor: Colors.white,
//                 trailing: Icon(
//                   Icons.home,
//                   color: Colors.white,
//                 ),
//                 onTap: () => Navigator.of(context).push(
//                     MaterialPageRoute(builder: (context) => MyHomePage())),
                    
//               ),
//               ListTile(
//                 title: Text("login"),
//                 textColor: Colors.white,
//                 trailing: Icon(
//                   Icons.login,
//                   color: Colors.white,
//                 ),
//                 onTap: () => Navigator.of(context)
//                     .push(MaterialPageRoute(builder: (context) => login())),
//               ),
//               ListTile(
//                 title: Text("Register"),
//                 textColor: Colors.white,
//                 trailing: Icon(
//                   Icons.app_registration_rounded,
//                   color: Colors.white,
//                 ),
//                 onTap: () => Navigator.of(context)
//                     .push(MaterialPageRoute(builder: (context) => Register())),
//               ),
//               ListTile(
//                 title: Text("Contacts"),
//                 textColor: Colors.white,
//                 trailing: Icon(
//                   Icons.contacts,
//                   color: Colors.white,
//                 ),
//                 onTap: () => Navigator.of(context)
//                     .push(MaterialPageRoute(builder: (context) => Contacts())),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key, required this.title});
//   final String title;
//   @override
//   State<HomeScreen> createState() => _HomeScreen();
// }

// class _HomeScreen extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     // return MaterialApp(
//         return DefaultTabController(
//           initialIndex: 2,
//             length: 3,
//             child: Scaffold(
//               drawer: NavDrawer(),
//               appBar: AppBar(
//                 bottom: TabBar(
//                   tabs: [
//                     Tab(child: Text('one')),
//                     Tab(child: Text('two')),
//                     Tab(child: Text('three')),
//                   ],
//                 ),
//                 title: Text(widget.title),
//               ),
//               body: TabBarView(
//                 children: [
//                   Tab(child: Text('1')),
//                   Tab(child: Text('2')),
//                   Tab(child: Text('3')),
//                 ],
//               ),
//             ));
//   }
// }

// class login extends StatefulWidget {
//   @override
//   State<login> createState() => _loginState();
// }

// class _loginState extends State<login> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: NavDrawer(),
//       appBar: AppBar(
//         title: Text("login"),
//       ),
//        body: ElevatedButton(
//         onPressed: () {
//           // Use Navigator to pop the current route when tapped on the screen
//           Navigator.pop(context);
//         },
//         child: Center(
//           child: Text("Login Page", style: TextStyle(fontSize: 50),),
//         ),
//       ),
//       // body: Center(
//       //   child: Text("login Page"),
//       // ),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   State<MyHomePage> createState() => homestate();
// }

// class homestate extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: NavDrawer(),
//       appBar: AppBar(
//         title: Text("Home"),
//       ),
//       body: Center(child: Text("Home Page")),
//     );
//   }
// }

// class Register extends StatefulWidget {
//   @override
//   State<Register> createState() => homestate1();
// }

// class homestate1 extends State<Register> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: NavDrawer(),
//       appBar: AppBar(
//         title: Text("Register"),
//       ),
//       body: Center(child: Text("Register Page")),
//     );
//   }
// }

// class Contacts extends StatefulWidget {
//   @override
//   State<Contacts> createState() => homestate2();
// }

// class homestate2 extends State<Contacts> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: NavDrawer(),
//       appBar: AppBar(
//         title: Text("Contacts"),
//       ),
//       body: Center(child: Text("Contact Page")),
//     );
//   }
// }
