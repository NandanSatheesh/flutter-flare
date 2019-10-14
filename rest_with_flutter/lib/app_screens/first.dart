import 'dart:math';

import 'package:flutter/material.dart';

class MyFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row(
          children: <Widget>[
            getContainerWithRandomNumber(),
            getContainerWithRandomNumber(),
            getContainerWithRandomNumber(),
            getContainerWithRandomNumber(),
          ],
        ),
        Row(
          children: <Widget>[
            getContainerWithRandomNumber(),
            getContainerWithRandomNumber(),
            getContainerWithRandomNumber(),
            getContainerWithRandomNumber(),
          ],
        ),
        Container(
          margin: EdgeInsets.all(20),
          child: RaisedButton(
            color: Colors.deepOrange,
            elevation: 6.0,
            child: Text('Raised Button'),
            onPressed: () => showAlertDialog(context),
          ),
        )
      ],
    );
  }

  void showAlertDialog(final BuildContext context) {
    var alertDialog = AlertDialog(
      title: Text("Clicked"),
      content: Text("Done"),
    );

    showDialog(
        context: context, builder: (BuildContext context) => alertDialog);
  }

  Widget getContainerWithRandomNumber() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(color: Colors.purple),
        margin: EdgeInsets.all(20),
        child: Text(
          generateRandomNumber(),
          style: TextStyle(fontSize: 10),
        ),
      ),
    );
  }

  String generateRandomNumber() {
    var random = Random();
    int randomNumber = random.nextInt(100);
    return "Your Random Number is $randomNumber";
  }
}
