import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dice App'),
          backgroundColor: Colors.red,
        ),
        body: Center(child: DicePage()),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 2;
  int rightDiceNumber = 3;

  void changeDiceState() {
    var random = new Random();
    leftDiceNumber = random.nextInt(6) + 1;
    rightDiceNumber = random.nextInt(6) + 1;
    print('The new left dice is $leftDiceNumber');

    print('The new right dice is $rightDiceNumber');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Expanded(
                child: FlatButton(
              child: Image.asset('images/dice$leftDiceNumber.png'),
              onPressed: () {
                setState(changeDiceState);
              },
            )),
            Expanded(
              child: FlatButton(
                child: Image.asset('images/dice$rightDiceNumber.png'),
                onPressed: () {
                  setState(changeDiceState);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
