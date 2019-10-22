import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Quote> fetchQuote() async {
  final response = await http.get('https://api.kanye.rest/');

  if (response.statusCode == 200) {
    return Quote.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load post');
  }
}

class Quote {
  final String quote;

  Quote({this.quote});

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      quote: json['quote'],
    );
  }
}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  Future<http.Response> fetchPost() {
    return http.get('https://api.kanye.rest');
  }

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  Future<Quote> quoteFromApi;
  bool apiCall = false;
  String quote = '';
  String byKanye = '- Kanye West';

  @override
  void initState() {
    super.initState();
    _callQuotesApi();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Kanye Quotes Again'),
        ),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                getProperWidget(),
                Text(
                  byKanye,
                  style: Theme.of(context).textTheme.display1.copyWith(
                        fontSize: 32.0,
                      ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              apiCall = true;
              byKanye = '';
            });
            _callQuotesApi();
          },
          child: Icon(Icons.refresh),
        ),
      ),
    );
  }

  Widget getProperWidget() {
    if (apiCall)
      return new CircularProgressIndicator();
    else
      return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(32.0),
        child: Text(
          '$quote',
          style: Theme.of(context).textTheme.display1,
        ),
      );
  }

  void _callQuotesApi() {
    fetchQuote().then((value) {
      setState(() {
        apiCall = false;
        quote = value.quote;
        byKanye = '- Kanye West';
      });
    }, onError: (error) {
      setState(() {
        apiCall = false;
        quote = error.toString();
      });
    });
  }
}
