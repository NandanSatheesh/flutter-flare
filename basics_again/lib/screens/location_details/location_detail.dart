import 'text_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'image_banner.dart';

class LocationDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Location"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ImageBanner("assets/images/image01.jpg"),
            TextSection("Summary", "Text Goes Here"),
            TextSection("Summary", "Text Goes Here"),
          ],
        ));
  }
}
