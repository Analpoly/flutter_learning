import 'package:flutter/material.dart';

void main() {
  runApp(TabBarDemo());
}

class TabBarDemo extends StatelessWidget {
  const TabBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(child: Text('one')),
                Tab(child: Text('two')),
                Tab(child: Text('three')),
              ],
            ),
            title: Text('Home page'),
          ),
          body: TabBarView(
            children: [
              Tab(child: Text('1')),
              Tab(child: Text('2')),
              Tab(child: Text('3')),
            ],
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Text('Drawer Header'),
                ),
                // ListTile(
                //   leading: Icon(Icons.home),
                //   title: const Text('Page 1 (Home)'),
                //   onTap: () {
                //     // Navigate to the Home page when the "Home" button is clicked
                //     Navigator.pop(context); // Close the drawer
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => HomePage()),
                //     );
                //   },
                // ),
                // In the TabBarDemo class
ListTile(
  leading: Icon(Icons.home),
  title:  Text('Page 1 (Home)'),
  onTap: () => Navigator.of(context)
    .push(MaterialPageRoute(builder: (context)=> HomePage()))
    // Navigate to the Home page when the "Home" button is clicked
    // Navigator.pop(context); // Close the drawer
    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(builder: (context) => HomePage()),
    // );
  
),

// In the _HomePageState class
// ElevatedButton(
//   onPressed: () {
//     Navigator.pop(context);
//   },
//   style: ElevatedButton.styleFrom(
//     backgroundColor: Colors.yellow,
//   ),
//   child: Text(
//     "go back",
//     style: TextStyle(fontSize: 50),
//   ),
// ),

                ListTile(
                  leading: Icon(Icons.train),
                  title: const Text('Page 3'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Create a new StatefulWidget for the Home page
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() =>_HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    drawer: TabBarDemo(),
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
