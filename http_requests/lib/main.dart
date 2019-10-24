import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_requests/models/image_model.dart';

void main() => runApp(ImageModelList());

class ImageModelList extends StatefulWidget {
  @override
  _ImageModelListState createState() => _ImageModelListState();
}

class _ImageModelListState extends State<ImageModelList> {
  List<ImageModel> list = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('http-requests'),
        ),
        body: ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.all(16.0),
                child: Card(
                  elevation: 4.0,
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                            width: 200,
                            height: 200,
                            child: Image.network(list[index].url)),
                        Text(list[index].title),
                      ],
                    ),
                  ),
                ),
              );
            }),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add), onPressed: getDataFromApi),
      ),
    );
  }

  int counter = 0;

  void getDataFromApi() async {
    counter++;
    var url = 'https://jsonplaceholder.typicode.com/photos/$counter';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      setState(() {
        list.add(ImageModel.fromJson(json.decode(response.body)));
      });
    }
  }
}
