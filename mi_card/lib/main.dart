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
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.phone,
                        color: Colors.teal,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '+91-876-217-1130',
                        style: TextStyle(
                            color: Colors.teal, fontFamily: 'Source Sans Pro'),
                      )
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.email,
                        color: Colors.teal,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'nandan.199776@gmail.com',
                        style: TextStyle(
                            color: Colors.teal, fontFamily: 'Source Sans Pro'),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
