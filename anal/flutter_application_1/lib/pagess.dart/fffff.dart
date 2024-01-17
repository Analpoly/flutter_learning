import 'package:flutter/material.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Drawer tutorial",
      theme: ThemeData(primarySwatch: Colors.blue),
      home:  HomeScreen(title: "Home"),
    );
  }
}

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.60,
      child: Drawer(
        child: Container(
          color: Colors.blue,
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Text('Drawer Header'),
                padding: EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                    image: AssetImage("assets/dojob.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              buildListTile(context, "Home", Icons.home, MyHomePage()),
              buildListTile(context, "Login", Icons.login, Login()),
              buildListTile(context, "Register", Icons.app_registration_rounded, Register()),
              buildListTile(context, "Contacts", Icons.contacts, Contacts()),
            ],
          ),
        ),
      ),
      
    );
  }

  ListTile buildListTile(BuildContext context, String title, IconData icon, Widget destination) {
    return ListTile(
      title: Text(title),
      textColor: Colors.white,
      trailing: Icon(icon, color: Colors.white),
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => destination)),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 2,
      length: 3,
      child: Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          bottom: TabBar(
            tabs: [
              Tab(child: Text('one')),
              Tab(child: Text('two')),
              Tab(child: Text('three')),
            ],
          ),
          title: Text(title),
        ),
        body: TabBarView(
          
          children: [
            Tab(child: Text('1')),
            Tab(child: Text('2')),
            Tab(child: Text('3')),
          ],
        ),
      ),
    );
  }
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(title: Text("Login")),
      body: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Center(child: Text("Login Page")),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(title: Text("Home")),
      body:GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Center(child: Text("Home page"),),
      ) ,
     
    );
  }
}

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(title: Text("Register")),
        body:GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Center(child: Text("Register page"),),
      ) ,
    );
  }
}

class Contacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(title: Text("Contacts")),
       body:GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Center(child: Text("Contact page"),),
      ) ,    );
  }
}
