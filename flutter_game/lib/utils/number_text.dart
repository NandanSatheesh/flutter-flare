import 'package:flutter/material.dart';
import 'package:flutter_game/styles/colors.dart';

class NumberText {
  static Text getTextWidgetForNumber(String number) {
    switch (number) {
      case '2':
        return Text(
          number,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: fontColorTwoFour,
          ),
        );
      case '4':
        return Text(
          number,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: fontColorTwoFour,
          ),
        );
      case '8':
        return Text(
          number,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: fontColorTwoFour,
          ),
        );
      case '16':
        return Text(
          number,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: fontColorTwoFour,
          ),
        );
      case '32':
        return Text(
          number,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: fontColorTwoFour,
          ),
        );
      case '64':
        return Text(
          number,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: fontColorTwoFour,
          ),
        );
      case '128':
        return Text(
          number,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: fontColorTwoFour,
          ),
        );
      case '256':
        return Text(
          number,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: fontColorTwoFour,
          ),
        );
      case '512':
        return Text(
          number,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: fontColorTwoFour,
          ),
        );
      case '1024':
        return Text(
          number,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: fontColorTwoFour,
          ),
        );
      case '2048':
        return Text(
          number,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: fontColorTwoFour,
          ),
        );
    }
  }
}
