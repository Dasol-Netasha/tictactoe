import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/options');
              },
              child: Text('Start Game'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/records');
              },
              child: Text('View Records'),
            ),
          ],
        ),
      ),
    );
  }
}