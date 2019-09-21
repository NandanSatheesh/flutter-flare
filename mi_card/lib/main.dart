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
          child: Column(
            children: <Widget>[
              Center(
                child: CircleAvatar(
                  radius: 80.0,
                  backgroundImage: NetworkImage(
                      'https://avatars0.githubusercontent.com/u/22286630?s=460&v=4'),
                  backgroundColor: Colors.transparent,
                ),
              ),
              Center(
                child: Text('Hi! I\'m Nandan',
                    style: TextStyle(
                        fontFamily: 'Pacifico',
                        fontSize: 40.0,
                        color: Colors.white,
                        letterSpacing: 2.5,
                        fontWeight: FontWeight.bold)),
              ),
              Center(
                child: Text('Software Developer',
                    style: TextStyle(
                        fontFamily: 'Source Sans Pro',
                        fontSize: 20.0,
                        color: Colors.teal[100],
                        letterSpacing: 2.5,
                        fontWeight: FontWeight.bold)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
