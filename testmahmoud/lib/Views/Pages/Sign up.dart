import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testmahmoud/Models/ModelUniversity.dart';
import 'package:testmahmoud/Models/Modelsign.dart';
import 'package:testmahmoud/ViewModel/signup_cubit/SignUpCubit.dart';
import 'package:testmahmoud/ViewModel/signup_cubit/SignUpState.dart';
import 'package:testmahmoud/Views/Component/Dialog.dart';
import 'package:testmahmoud/Views/Component/EditTextForm.dart';
import 'package:testmahmoud/Views/Component/Editbutton.dart';
import 'package:testmahmoud/Views/Component/edittext.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'dart:ui';
import 'Login.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    List<DropdownMenuItem<String>> GenderItems = [
      DropdownMenuItem(child: Text("Male"), value: "m"),
      DropdownMenuItem(child: Text("Female"), value: "f"),
    ];
    List<DropdownMenuItem<String>> gradeItems = [
      DropdownMenuItem(child: Text("1"), value: "1"),
      DropdownMenuItem(child: Text("2"), value: "2"),
      DropdownMenuItem(child: Text("3"), value: "3"),
      DropdownMenuItem(child: Text("3"), value: "4"),
    ];
    return BlocProvider(
      create: (context) => SignupCubit()..GetAllUniversities(),
      child: BlocConsumer<SignupCubit, SignupState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = SignupCubit.GetInstence(context);
            DropItem(item) {
              return DropdownMenuItem(
                  child: Text("${item.name}"), value: item.id.toString());
            }

            List<DropdownMenuItem<String>> UniversityItems = [];
            if (cubit.universityModel?.universityData != null) {
              int len = cubit.universityModel!.universityData.length;
              for (int i = 0; i < len; i++) {
                var model = cubit.universityModel?.universityData[i];
                UniversityItems.add(DropItem(model));
              }
            }
            return ModalProgressHUD(
                inAsyncCall: state is SignupLoading,
                progressIndicator: CircularProgressIndicator(
                  color: Colors.orange,
                ),
                child: SafeArea(
                  child: Scaffold(
                    backgroundColor: Colors.white,
                    body: SingleChildScrollView(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: height * .05,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                EditText(
                                  text: "Orange ",
                                  color: Colors.orange,
                                  fontsize: 25.0,
                                  fontwight: FontWeight.bold,
                                  textDecoration: TextDecoration.none,
                                ),
                                EditText(
                                  text: "Digtal Center",
                                  color: Colors.black,
                                  fontsize: 25.0,
                                  fontwight: FontWeight.bold,
                                  textDecoration: TextDecoration.none,
                                ),
                              ],
                            ),
                            Container(
                              height: height * .09,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: width * .02,
                                ),
                                EditText(
                                  text: "Sign Up",
                                  color: Colors.black,
                                  fontsize: 34.0,
                                  fontwight: FontWeight.bold,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * .07,
                            ),
                            Form(
                                key: globalKey,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(10),
                                      child: EditTextForm(
                                          value: 0,
                                          text: "Name",
                                          ColorOfLabel: Colors.grey[400],
                                          ColorOfline: Colors.deepOrange,
                                          isScure: false),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(10),
                                      child: EditTextForm(
                                          value: 1,
                                          text: "Email",
                                          ColorOfLabel: Colors.grey[400],
                                          ColorOfline: Colors.deepOrange,
                                          isScure: false),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(10),
                                      child: EditTextForm(
                                        value: 2,
                                        text: "Password",
                                        ColorOfLabel: Colors.grey[400],
                                        ColorOfline: Colors.deepOrange,
                                        isScure: true,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(10),
                                      child: EditTextForm(
                                        value: 3,
                                        text: "Phone Number",
                                        ColorOfLabel: Colors.grey[400],
                                        ColorOfline: Colors.deepOrange,
                                        isScure: false,
                                      ),
                                    ),
                                  ],
                                )),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: EditText(
                                    color: Colors.black,
                                    fontwight: FontWeight.bold,
                                    fontsize: 15.0,
                                    text: "Gender",
                                  ),
                                ),
                                DropdownButton(
                                  onChanged: (val) {
                                    cubit.ChangeGender(val);
                                  },
                                  value: cubit.gender,
                                  items: GenderItems,
                                ),
                                SizedBox(
                                  width: width * .2,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: EditText(
                                    color: Colors.black,
                                    fontwight: FontWeight.bold,
                                    fontsize: 15.0,
                                    text: "Grade",
                                  ),
                                ),
                                DropdownButton(
                                  onChanged: (val) {
                                    cubit.ChangeGrade(val);
                                  },
                                  value: cubit.grade,
                                  items: gradeItems,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: EditText(
                                    color: Colors.black,
                                    fontwight: FontWeight.bold,
                                    fontsize: 15.0,
                                    text: "University",
                                  ),
                                ),
                                (state is UniversityLoading)
                                    ? Container()
                                    : DropdownButton(
                                        onChanged: (val) {
                                          cubit.ChangeUniversity(val);
                                        },
                                        value: cubit.University,
                                        items: UniversityItems,
                                      ),
                              ],
                            ),
                            SizedBox(
                              height: height * .06,
                            ),
                            EditButton(
                              onPressed: () async {
                                if (globalKey.currentState != null) {
                                  if (globalKey.currentState!.validate()) {
                                    globalKey.currentState!.save();

                                    var response = await cubit.SignUp(data: {
                                      "name": sign?[0],
                                      "email": sign?[1],
                                      "password": sign?[2],
                                      "phoneNumber": sign?[3],
                                      "universityId":
                                          int.parse(cubit.University),
                                      "gradeId": int.parse(cubit.grade),
                                      "gender": cubit.gender,
                                      "roleId": 4
                                    });
                                    if (response == true)
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) => Login()));
                                    else {
                                      dialog(context, response);
                                    }
                                  }
                                }
                              },
                              height: height * .06,
                              width: width * .9,
                              text: "Sign Up",
                              fontsize: 16.0,
                              fontwight: FontWeight.bold,
                              color: Colors.white,
                              colorOfBorder: Colors.deepOrange,
                              colorOfButton: Colors.deepOrange,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ));
          }),
    );
  }
}
