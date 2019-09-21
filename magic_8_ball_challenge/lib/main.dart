import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Ask me Anything'),
          ),
          body: AskMeAnything(),
        ),
      ),
    );

class AskMeAnything extends StatefulWidget {
  @override
  _AskMeAnythingState createState() => _AskMeAnythingState();
}

class _AskMeAnythingState extends State<AskMeAnything> {
  int imageState = 1;

  void changeState() {
    var random = new Random();
    imageState = random.nextInt(5) + 1;
    print('The new state is $imageState');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: FlatButton(
                onPressed: () {
                  setState(changeState);
                },
                child: Image.asset('images/ball$imageState.png')),
          )
        ],
      ),
    );
  }
}
