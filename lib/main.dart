import 'package:flutter/material.dart';
import 'convert.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  MyHomeState createState() => MyHomeState();
}

class MyHomeState extends State<MyApp> {
  // This widget is the root of your application.

  TextEditingController inMinutes = new TextEditingController();

  var listItem = ["Second"];
  List<String> listViewItem = List<String>();
  double _inputUser = 0;
  String _newValue = "Second";
  double _result = 0;

  void _count() {
    setState(() {
      _inputUser = double.parse(inMinutes.text);

      if (_newValue == "Second") _result = _inputUser * 60;

      listViewItem.add(_newValue + " : " + _result.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Time Converter"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //DROPDOWN
              DropdownButton<String>(
                items: listItem.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                value: _newValue,
                onChanged: (String changeValue) {
                  setState(() {
                    _newValue = changeValue;
                    _count();
                  });
                },
              ),
              //RESULT
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Result",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      _result.toStringAsFixed(1),
                      style: TextStyle(fontSize: 30),
                    )
                  ],
                ),
              ),

              //CONVERT
              Convert(convertHandler: _count),

              //HISTORY
            ],
          ),
        ),
      ),
    );
  }
}
