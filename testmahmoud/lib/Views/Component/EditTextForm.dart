import 'package:flutter/material.dart';
import 'package:testmahmoud/Views/Component/validation.dart';

import '../../Models/Modelsign.dart';

class EditTextForm extends StatelessWidget {
  EditTextForm(
      {Key? key,
       this.typeKeyboard,
      this.Check,
      this.text,
      this.ColorOfLabel,
      this.ColorOfline,
      this.isScure,
      this.value})
      : super(key: key);
  final Check;
  final text;
  final typeKeyboard;
  final ColorOfLabel;
  final ColorOfline;
  final isScure;
  final value;

  @override
  Widget build(BuildContext context) {
    String? name;
    return TextFormField(
      keyboardType: typeKeyboard,
      validator: Check,
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
