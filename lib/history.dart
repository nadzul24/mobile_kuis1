import 'package:flutter/material.dart';

class History extends StatelessWidget {
  const History({Key key, @required this.listViewItem});
  final List<String> listViewItem;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: listViewItem.map((String value) {
        return Container(
            margin: EdgeInsets.all(10),
            child: Text(
              value,
              style: TextStyle(fontSize: 15),
            ));
      }).toList(),
    );
  }
}
