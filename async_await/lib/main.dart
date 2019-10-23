import 'dart:async';
import 'dart:convert';

import 'package:async_await/post_view.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String url = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<dynamic>> data;

  @override
  void initState() {
    super.initState();
    data = this.getJsonData();
  }

  Future<List<dynamic>> getJsonData() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {'Accept': 'application/json'});

    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Async and Await'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: getJsonData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.hasError);
          }

          return snapshot.hasData
              ? getCardListBuilder(snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget getCardListBuilder(List<dynamic> data) {
    return Container(
      margin: EdgeInsets.all(16.0),
      padding: EdgeInsets.all(16.0),
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PostView()),
              );
            },
            child: Card(
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      data[index]['title'],
                      style: Theme.of(context).textTheme.title,
                    ),
                    Text(
                      data[index]['body'],
                      style: Theme.of(context).textTheme.body1,
                    ),
                  ],
                ),
              ),
              elevation: 4,
            ),
          );
        },
        itemCount: data.length,
      ),
    );
  }
}
