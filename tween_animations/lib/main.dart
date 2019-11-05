import 'package:animator/animator.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Animator(
      repeats: 0,
      duration: Duration(seconds: 12),
      tween: Tween<double>(begin: 0, end: 2 * math.pi),
      builder: (anim) => Transform.rotate(
          angle: anim.value,
          child: FlutterLogo(
            size: 100,
          )),
    );
  }
}
