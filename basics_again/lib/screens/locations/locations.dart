import 'package:basics_again/app.dart';

import '../../screens/models/location.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Locations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final locations = Location.fetchAll();

    return Scaffold(
      appBar: AppBar(
        title: Text('Locations'),
      ),
      body: ListView(
        children: locations
            .map((location) => GestureDetector(
                onTap: () => {_handleLocationTap(context, location.id)},
                child: Text(location.name)))
            .toList(),
      ),
    );
  }

  _handleLocationTap(BuildContext context, int locationId) {
    Navigator.pushNamed(context, LocationDetailRoute,
        arguments: {"id": locationId});
  }
}
