import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testmahmoud/ViewModel/faq_cuibt/faq_cuibt.dart';
import 'package:testmahmoud/database/local/cache_helper.dart';
import 'package:testmahmoud/view/pages/FaqScreen.dart';
import 'package:testmahmoud/view/pages/MainScreen.dart';
import 'package:testmahmoud/view/pages/dioHelper.dart';

import 'view/pages/Login.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.inti();
  await CacheHelper.init();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  var token=CacheHelper.get(key: "token");

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [

      BlocProvider(create: (context) => FAQ_Cuibt()),


    ], child:
    MaterialApp(
      routes:{
        'FAQ':(context) => FAQScreen(),
      },
      home: (token is String && token.length >0 )?MainScreen():Login(),
      debugShowCheckedModeBanner: false,
    ) );

  }
}
