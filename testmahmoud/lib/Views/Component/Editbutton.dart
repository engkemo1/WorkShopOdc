import 'package:flutter/material.dart';
import 'package:testmahmoud/Views/Component/edittext.dart';

class EditButton extends StatelessWidget {
    EditButton(
      {Key? key,
      this.colorOfButton,
      this.height,
      this.width,
      this.text,
      this.fontsize,
      this.fontwight,
      this.color,this.icon,this.raduis,
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
  final raduis;
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
                  borderRadius: BorderRadius.circular((raduis!=null)?raduis:8))),
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
