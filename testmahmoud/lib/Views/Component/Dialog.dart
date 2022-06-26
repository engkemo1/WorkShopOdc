import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

dialog(context, message) {
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.NO_HEADER,
    animType: AnimType.BOTTOMSLIDE,

    title: '',
    // padding: const EdgeInsets.all(5.0),
    desc: message,

    btnOkOnPress: () {},
  ).show();
}
