import 'dart:convert';

List<String> namesResponseFromJson(String str) => List<String>.from(json.decode(str).map((x) => x));

String namesResponseToJson(List<String> data) => json.encode(List<dynamic>.from(data.map((x) => x)));
