import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Input extends StatelessWidget {
  const Input({
    Key key,
    @required this.inMinutes,
  }) : super(key: key);

  final TextEditingController inMinutes;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: inMinutes,
        decoration: InputDecoration(hintText: "Enter the time in minutes"),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[0-9+\.]')),
        ],
        keyboardType:
            TextInputType.numberWithOptions(decimal: true, signed: false));
  }
}
