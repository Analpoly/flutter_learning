// import 'package:flutter/material.dart';

// void main()
// {
//   runApp(MaterialApp(
//     home:Drake();
//   ));
// }
// class Drake extends stat
import 'package:flutter/material.dart';

void main() {
  runApp( TabBarDemo());
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
            bottom:  TabBar(
              tabs: [
                 Tab(child: Text('one')),
              Tab(child: Text('two')),
              Tab(child: Text('three')),
               
              ],
            ),
            title:  Text('Home page'),
          ),
          body:  TabBarView(
            children: [
                 Tab(child: Text('1')),
              Tab(child: Text('2')),
              Tab(child: Text('3')),
             
            ],
          ),
            drawer: Drawer(
              child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
            ),
            title: const Text('Page 1'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.train,
            ),
            title: const Text('Page 2'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    ),
    
    // body: Center(
    //   child: Column(
    //     children: [
    //       SizedBox(
    //         height: 50,
    //       ),
    //     ],
    //   ),
    // ),
  )));
}
          // child: returnw(),
          // elevation: 20,
//         ),
//         ),
//       ),
//     );
//   }
// }

// returnw(NavItem state) {
//   switch (state) {
//       case NavItem.homePage:
//         return 'Home';
//       case NavItem.profilePage:
//         return 'Profile Page';
//       case NavItem.orderPage:
//         return 'My Orders';
//       case NavItem.myCart:
//         return 'My Cart';
//       default:
//         return '';
//     }

// }
 // ignore: unused_element
//  _getAppbarTitle(NavItem state) {
//     switch (state) {
//       case NavItem.homePage:
//         return 'Home';
//       case NavItem.profilePage:
//         return 'Profile Page';
//       case NavItem.orderPage:
//         return 'My Orders';
//       case NavItem.myCart:
//         return 'My Cart';
//       default:
//         return '';
//     }
//   }
}