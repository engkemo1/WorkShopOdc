import 'package:flutter/material.dart';
import 'package:testmahmoud/Views/Component/edittext.dart';
import 'package:testmahmoud/Views/Pages/Sign%20up.dart';

class EditButton extends StatelessWidget {
    EditButton(
      {Key? key,
      this.colorOfButton,
      this.height,
      this.width,
      this.text,
      this.fontsize,
      this.fontwight,
      this.color,this.icon,
      this.colorOfBorder,this.onPressed})
      : super(key: key);
  final onPressed;
  final height;
  final width;
  final text;
  final color;
  final fontsize;
  final fontwight;
  final colorOfBorder;
  final colorOfButton;
 Widget?  icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              side: BorderSide(color: colorOfBorder, width: 1),
              primary: colorOfButton,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
          onPressed:onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              EditText(
                text: "$text",
                color: color,
                fontsize: fontsize,
                fontwight: fontwight,
                textDecoration: TextDecoration.none,
              ),
            ],
          )),
    );
  }
}
