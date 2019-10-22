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

  @override
  void initState() {
    super.initState();
    quoteFromApi = fetchQuote();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FutureBuilder<Quote>(
                    future: quoteFromApi,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text(snapshot.data.quote);
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      return CircularProgressIndicator();
                    },
                  ),
                  Text('- Kanye West'),
                ],
              ),
            ),
          ),
        ));
  }
}
