import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 1'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Screen2()),
            );
          },
          child: Hero(
            tag: 'imageHero',
            child: Image.network(
              'assets/dojob.png',
              width: 100,
            ),
          ),
        ),
      ),
    );
  }
}
class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 2'),
      ),
      body: Center(
        child: Hero(
          tag: 'imageHero', // Same tag as on Screen1
          child: Image.network(
            'assets/money.png',
            width: 300,
          ),
        ),
      ),
    );
  }
}
