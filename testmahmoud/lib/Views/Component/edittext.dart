import 'package:flutter/material.dart';

class EditText extends StatelessWidget {
  const EditText(
      {Key? key, this.text, this.color, this.fontsize, this.fontwight,this.textDecoration})
      : super(key: key);
  final text;
  final color;
  final fontsize;
  final fontwight;
  final textDecoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      "$text",
      style: TextStyle(color: color, fontSize: fontsize, fontWeight: fontwight,decoration:textDecoration ),
    );
  }
}
