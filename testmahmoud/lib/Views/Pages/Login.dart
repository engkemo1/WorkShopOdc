import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:testmahmoud/ViewModel/login_cubit/LoginCubit.dart';
import 'package:testmahmoud/ViewModel/login_cubit/LoginState.dart';
import 'package:testmahmoud/Views/Component/Dialog.dart';
import 'package:testmahmoud/Views/Component/EditTextForm.dart';
import 'package:testmahmoud/Views/Component/Editbutton.dart';
import 'package:testmahmoud/Views/Component/edittext.dart';
import 'dart:ui';
import '../../Models/Modelsign.dart';
import 'Sign up.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  GlobalKey<FormState> globalKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = LoginCubit.GetInstence(context);

          CheckResponse(response) {
            if (response == true) {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Login()));
            } else {
              dialog(context, response);
            }
          }

          return ModalProgressHUD(
              inAsyncCall: state is LoginLoading,
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
                              text: "Login",
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
                                        text: "Email",
                                        ColorOfLabel: Colors.grey[400],
                                        ColorOfline: Colors.deepOrange,
                                        isScure: false)),
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: EditTextForm(
                                    value: 1,
                                    text: "Password",
                                    ColorOfLabel: Colors.grey[400],
                                    ColorOfline: Colors.deepOrange,
                                    isScure: true,
                                  ),
                                ),
                              ],
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: EditText(
                                  text: "Forget Password?",
                                  color: Colors.orange,
                                  fontsize: 15.0,
                                  fontwight: FontWeight.bold,
                                  textDecoration: TextDecoration.underline,
                                )),
                          ],
                        ),
                        SizedBox(
                          height: height * .06,
                        ),
                        EditButton(
                          onPressed: () async {
                            var formdata = globalKey.currentState;
                            if (formdata != null && formdata.validate()) {
                              formdata.save();
                              var response = await cubit.Login(data: {
                                "email": sign?[0],
                                "password": sign?[1]
                              });
                              CheckResponse(response);
                            }
                          },
                          height: height * .06,
                          width: width * .9,
                          text: "Login",
                          fontsize: 16.0,
                          fontwight: FontWeight.bold,
                          color: Colors.white,
                          colorOfBorder: Colors.deepOrange,
                          colorOfButton: Colors.deepOrange,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: EditText(
                            text: "-OR-",
                            color: Colors.grey[300],
                            fontwight: FontWeight.bold,
                            fontsize: 15.0,
                          ),
                        ),
                        EditButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SignUp()));
                          },
                          height: height * .06,
                          width: width * .9,
                          text: "Sign Up",
                          fontsize: 16.0,
                          fontwight: FontWeight.bold,
                          color: Colors.orange,
                          colorOfBorder: Colors.deepOrange,
                          colorOfButton: Colors.white,
                        ),
                      ],
                    ),
                  )),
                ),
              ));
        },
      ),
    );
  }
}
