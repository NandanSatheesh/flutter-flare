import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("I am Poor"),
          actions: [
            new IconButton(icon: new Icon(Icons.search), onPressed: () {}),
          ],
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: Center(
          child: Image.network(
              'https://images.unsplash.com/photo-1541233349642-6e425fe6190e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=975&q=80'),
        ),
      ),
    ));
