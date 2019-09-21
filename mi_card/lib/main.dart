import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Row(
            children: <Widget>[
              Container(
                width: 80,
                height: 500,
                color: Colors.green,
              ),
              Container(
                width: 80,
                height: 500,
                color: Colors.blue,
              )
            ],
          ),
        ),
      ),
    );
  }
}
