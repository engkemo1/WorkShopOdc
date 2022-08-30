import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testmahmoud/ViewModel/Terms_Cubit/TermsCubit.dart';
import 'package:testmahmoud/ViewModel/Terms_Cubit/TermsState.dart';
import 'package:simple_html_css/simple_html_css.dart';

import '../../Views/Component/constant.dart';
import '../../Views/Component/edittext.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocProvider(
        create: (context) => TermsCubit()..GetTerms(),
        child: BlocConsumer<TermsCubit, TermsState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = TermsCubit.GetInstance(context);



            return Scaffold(
              backgroundColor: Colors.grey[100],
              appBar: AppBar(

                backgroundColor: Colors.white,
                centerTitle: true,
                elevation: 0,
                leading: IconButton(
                  onPressed: () {Navigator.pop(context);},
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 28,
                    color: orange,
                  ),
                ),
                title: EditText(
                    text: "Terms",
                    color: Colors.black,

                    fontsize: 23.0,
                    fontwight: FontWeight.bold),
              ),
              body: SingleChildScrollView(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Column(

                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: (state is! TermsLoading &&
                                      cubit.termsModel?.terms != null)
                                  ? RichText(
                                      text: HTML.toTextSpan(
                                          context, cubit.termsModel?.terms,
                                          defaultTextStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                              color: Colors.grey[600],
                                              decoration: TextDecoration.none,
                                              fontSize: 17.0,

                                              ),

                                      ))
                                  : Container()),
                          SizedBox(
                            height: height * .05,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
