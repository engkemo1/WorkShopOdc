import 'package:flutter/material.dart';

import 'package:testmahmoud/Views/Pages/Login.dart';
import 'package:testmahmoud/Views/Pages/PageNews.dart';
import 'package:testmahmoud/database/remote/dioHelper.dart';

import 'Views/Pages/Sign up.dart';

import 'dart:ui';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.inti();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
      debugShowCheckedModeBanner: false,
    );
  }
}
