import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'New Basic App',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        body: MyWidget(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            debugPrint("FAB Pressed");
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text('Profile Save')));
          },
        ),
      ),
    );
  }

  void showSnackBar(BuildContext context) {
    var snackBar = SnackBar(
      content: Text('This is some text'),
    );

    Scaffold.of(context).showSnackBar(snackBar);
  }

  List<String> getListItems() {
    var items = List<String>.generate(1000, (counter) => "Item $counter");

    return items;
  }

  Widget getListView(BuildContext context) {
    var listItems = getListItems();

    var listView = ListView.builder(itemBuilder: (context, index) {
      return ListTile(title: Text(listItems[index]));
    });

    return listView;
  }

  void showAlertDialog(final BuildContext context) {
    var alertDialog = AlertDialog(
      title: Text("Clicked"),
      content: Text("Done"),
    );

    showDialog(
        context: context, builder: (BuildContext context) => alertDialog);
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.account_circle, size: 50)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Flutter McFlutter',
                    style: Theme.of(context).textTheme.headline),
                Text('Experienced App Developer'),
              ],
            ),
          ],
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('123 Main Street'),
            Text('415-555-0198'),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.accessibility),
            Icon(Icons.timer),
            Icon(Icons.phone_android),
            Icon(Icons.phone_iphone),
          ],
        ),
      ],
    );
  }
}
