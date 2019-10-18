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
            'SI Basic App',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        body: SIForm(),
      ),
    );
  }
}

class SIForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SIFormState();
  }
}

class _SIFormState extends State<SIForm> {
  var _currencies = ['Rupee', 'Dollar', 'Pounds'];

  var _currentItemSelected = 'Rupee';

  String text = 'Your Simple Interest is ';
  String calculated = '';

  TextEditingController principleController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController rateOfInterestController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Image.asset('assets/bank.jpeg'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: principleController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Principal',
                  hintText: 'Enter Principal e.g. 1200',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: rateOfInterestController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Rate of Interest',
                  hintText: 'Enter Rate of Interest  e.g. 12',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: TextField(
                    controller: timeController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Duration',
                      hintText: 'Enter Duration in Years e.g. 1',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                    ),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                    child: DropdownButton<String>(
                  items: _currencies.map((String value) {
                    return DropdownMenuItem(child: Text(value), value: value);
                  }).toList(),
                  value: _currentItemSelected,
                  onChanged: (String newValueSelected) {
                    setState(() {
                      _currentItemSelected = newValueSelected;
                    });
                  },
                )),
                SizedBox(
                  width: 12,
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    child: Text('Calculate'),
                    onPressed: () {
                      setState(() {
                        calculateTotalReturns();
                      });
                    },
                  ),
                ),
                Container(
                  width: 12,
                ),
                Expanded(
                  child: RaisedButton(
                    child: Text('Reset'),
                    onPressed: () {
                      setState(() {
                        principleController.clear();
                        timeController.clear();
                        rateOfInterestController.clear();
                        calculated = '';
                      });
                    },
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                this.calculated,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void calculateTotalReturns() {
    double principle = double.parse(principleController.text);
    double time = double.parse(timeController.text);
    double rate = double.parse(rateOfInterestController.text);

    double interest = (principle * time * rate) / 100.0;

    this.calculated = text + interest.toString() + ' ' + _currentItemSelected;
  }
}
