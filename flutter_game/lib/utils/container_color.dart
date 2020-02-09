import 'package:flutter/material.dart';
import 'package:flutter_game/styles/colors.dart';

class ContainerColor {
  static Color getContainerColor(String number) {
    switch (number) {
      case '0':
        return emptyGridBackground;
      case '2':
        return gridColorTwoFour;
      case '4':
        return gridColorTwoFour;
      case '8':
        return gridColorEightSixtyFourTwoFiftySix;
      case '16':
        return gridColorSixteenThirtyTwoOneZeroTwoFour;
      case '32':
        return gridColorSixteenThirtyTwoOneZeroTwoFour;
      case '64':
        return gridColorEightSixtyFourTwoFiftySix;
      case '128':
        return gridColorOneTwentyEightFiveOneTwo;
      case '256':
        return gridColorEightSixtyFourTwoFiftySix;
      case '512':
        return emptyGridBackground;
      case '1024':
        return gridColorSixteenThirtyTwoOneZeroTwoFour;
      case '2048':
        return gridColorOneTwentyEightFiveOneTwo;
    }
  }
}
