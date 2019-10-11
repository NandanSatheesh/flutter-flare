import 'dart:math';

import 'package:flutter/material.dart';

class MyFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            margin: EdgeInsets.all(20.0),
            padding: EdgeInsets.all(20.0),
            decoration:
                BoxDecoration(color: Colors.green, shape: BoxShape.rectangle),
            child: Text(
              generateRandomNumber(),
              style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  fontSize: 40,
                  color: Colors.blue),
            )));
  }

  String generateRandomNumber() {
    var random = Random();
    int randomNumber = random.nextInt(100);
    return "Your Random Number is $randomNumber";
  }
}
