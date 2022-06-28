import 'package:flutter/material.dart';
import 'package:testmahmoud/Views/Component/Editbutton.dart';
import 'package:testmahmoud/Views/Component/RaduisTextForm.dart';

import '../../Views/Component/edittext.dart';
import '../../Views/Component/validation.dart';

class Support extends StatelessWidget {
  const Support({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 4,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios,
            size: 28,
          ),
        ),
        title: EditText(
            text: "SUPPORT",
            color: Colors.white,
            fontsize: 30.0,
            fontwight: FontWeight.bold),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
                child: RaduisTextForm(
                  labeltext: "Name",
                  icon: Icon(Icons.person),
                  lines: 1,
                  value: 0,
                  Check: (val) {
                    if (val == null || val.length == 0)
                      return "Please enter name!";
                    if (!RegExp(validationName).hasMatch(val))
                      return "Name must be valid";
                  },
                  ColorOfSide: Colors.grey.shade500,
                  raduis: 20.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
                child: RaduisTextForm(
                  lines: 1,
                  labeltext: "Email",
                  icon: Icon(Icons.email),
                  value: 1,
                  Check: (val) {
                    if (val == null || val.length == 0)
                      return "Please enter name!";
                    if (!RegExp(validationName).hasMatch(val))
                      return "Name must be valid";
                  },
                  ColorOfSide: Colors.grey.shade500,
                  raduis: 20.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Container(
                  child: RaduisTextForm(
                    lines: 5,
                    raduis: 15.0,
                    ColorOfSide: Colors.grey.shade500,
                    value: 2,
                    hintText: "What's making you unhappy?",
                  ),
                ),
              ),
              EditButton(
                raduis: 20.0,
                text: "Submit",
                height: height * .05,
                width: width * .87,
                fontsize: 25.0,
                fontwight: FontWeight.bold,
                onPressed: (){},
                colorOfBorder: Colors.deepOrange,
                colorOfButton: Colors.deepOrange,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
