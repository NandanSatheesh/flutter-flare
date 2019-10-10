import 'package:flutter/material.dart';

import 'app_screens/first.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'New Basic App',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        body: MyFlutterApp(),
      ),
    );
  }
}
