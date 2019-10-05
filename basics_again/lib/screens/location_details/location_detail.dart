import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../screens/models/location.dart';
import 'image_banner.dart';
import 'text_section.dart';

class LocationDetails extends StatelessWidget {
  final int _locationId;

  LocationDetails(this._locationId);

  @override
  Widget build(BuildContext context) {
    final location = Location.fetchByID(_locationId);

    return Scaffold(
        appBar: AppBar(
          title: Text(location.name),
        ),
        body: new SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ImageBanner(location.imagePath),
            ]..addAll(textSections(location)),
          ),
        ));
  }

  List<Widget> textSections(Location location) {
    return location.facts
        .map(
          (fact) => TextSection(fact.title, fact.text),
        )
        .toList();
  }
}
