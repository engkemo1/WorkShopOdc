import 'package:flutter/material.dart';

import '../../Models/Modelsign.dart';

class EditTextForm extends StatelessWidget {
  EditTextForm(
      {Key? key,
      this.text,
      this.ColorOfLabel,
      this.ColorOfline,
      this.isScure,
      this.value})
      : super(key: key);
  final text;
  final ColorOfLabel;
  final ColorOfline;
  final isScure;
  final value;
  @override
  Widget build(BuildContext context) {
    String? name;
    return TextFormField(
      validator: (val) {
        if (val == null || val.length == 0) return "required";
      },
      onSaved: (val) {
        sign?[value] = val;
      },
      obscureText: isScure,
      decoration: InputDecoration(
        labelText: "$text",
        labelStyle: TextStyle(
            color: ColorOfLabel, fontSize: 18, fontWeight: FontWeight.bold),
        focusColor: Colors.orange,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: ColorOfline),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: ColorOfline),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: ColorOfline),
        ),
      ),
      cursorColor: Colors.orange,
    );
  }
}
