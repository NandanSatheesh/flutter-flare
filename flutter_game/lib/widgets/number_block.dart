import 'package:flutter/material.dart';
import 'package:flutter_game/utils/container_color.dart';
import 'package:flutter_game/utils/number_text.dart';

class NumberBlock extends StatelessWidget {
  NumberBlock({this.number, this.width, this.height});

  final String number;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: ContainerColor.getContainerColor(number),
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: Center(
          child: NumberText.getTextWidgetForNumber(number),
        ),
      );
}
