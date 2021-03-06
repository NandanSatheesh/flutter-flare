import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'screens/location_details/location_detail.dart';
import 'screens/locations/locations.dart';
import 'style.dart';

const LocationRoute = '/';
const LocationDetailRoute = '/location_detail';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(onGenerateRoute: _routes(), theme: _theme());
  }

  ThemeData _theme() {
    return ThemeData(
        appBarTheme: AppBarTheme(
            textTheme: TextTheme(
          title: AppBarTextStyle,
        )),
        textTheme: TextTheme(
          title: TitleTextStyle,
          body1: Body1TextStyle,
        ));
  }
}

RouteFactory _routes() {
  return (settings) {
    final Map<String, dynamic> arguments = settings.arguments;

    Widget screen;
    switch (settings.name) {
      case LocationRoute:
        screen = Locations();
        break;
      case LocationDetailRoute:
        screen = LocationDetails(arguments['id']);
        break;
      default:
        return null;
    }

    return MaterialPageRoute(builder: (BuildContext context) => screen);
  };
}
