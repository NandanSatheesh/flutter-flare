import 'dart:math';

import 'package:flutter/material.dart';

class MyFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        getContainerWithRandomNumber(),
        getContainerWithRandomNumber(),
        getContainerWithRandomNumber(),
        getContainerWithRandomNumber(),
      ],
    );
  }

  Widget getContainerWithRandomNumber() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(color: Colors.purple),
        margin: EdgeInsets.all(20),
        child: Text(generateRandomNumber()),
      ),
    );
  }

  String generateRandomNumber() {
    var random = Random();
    int randomNumber = random.nextInt(100);
    return "Your Random Number is $randomNumber";
  }
}
