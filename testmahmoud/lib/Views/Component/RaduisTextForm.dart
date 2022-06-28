import 'package:flutter/material.dart';

import '../../Models/Modelsign.dart';

class RaduisTextForm extends StatelessWidget {
  RaduisTextForm(
      {Key? key,
        this.lines,
      this.icon,
      this.value,
      this.Check,
      this.labeltext,
        this.hintText,
      this.ColorOfSide,
      this.raduis})
      : super(key: key);
  final hintText;
  final labeltext;
  final ColorOfSide;
  final raduis;
  final Check;
  final value;
  final icon;
  final lines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: Check,
      onSaved: (val) {
        sign?[value] = val;
      },

      maxLines: lines,
      decoration: InputDecoration(

        filled: true,

        hintText: hintText,
          prefixIcon: icon,
          labelText: labeltext,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(raduis),
              borderSide: BorderSide(color: ColorOfSide)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(raduis),
              borderSide: BorderSide(color: ColorOfSide)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(raduis),
              borderSide: BorderSide(color: ColorOfSide))),
    );
  }
}
