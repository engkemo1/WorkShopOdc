import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_html_css/simple_html_css.dart';
import 'package:testmahmoud/ViewModel/faq_cuibt/faq_cuibt.dart';
import 'package:testmahmoud/ViewModel/faq_cuibt/faq_state.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios,color: Color(0xffff6600),)),
                Text(
                  'FAQ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(width: MediaQuery.of(context).size.width*0.1,child: Text(''),)

              ],
            ),
            SizedBox(
              height: 40,
            ),
            BlocProvider.value(
                value: FAQ_Cuibt.get(context)..getFaq(),
                child: BlocConsumer<FAQ_Cuibt, FAQ_State>(
                    builder: (context, state) {
                      var f = FAQ_Cuibt.get(context);

                      return Expanded(
                          child: ListView.builder(
                        itemBuilder: (context, index) {
                          String htmlContentanswer = """
                      ${f.faq!.data![index].answer}
                      
""";
                          String htmlContentQuestion = """
                      ${f.faq!.data![index].question}
                      
""";
                          return
                            Container(
                              child:Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                              ExpandablePanel(
                              theme: ExpandableThemeData(
                              iconColor: Color(0xffff6600),
                                collapseIcon: Icons.keyboard_arrow_down,
                                expandIcon: Icons.keyboard_arrow_down,
                                useInkWell: true,
                                headerAlignment:
                                ExpandablePanelHeaderAlignment.center,
                                iconSize: 50),
                          header: Container(
                          height: 80,
                          decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          // boxShadow: [
                          //   BoxShadow(
                          //       offset: Offset(1, 3),
                          //       blurRadius: 3,
                          //       color: Colors.grey)
                          // ]
                          ),
                          child:


                          Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,

children: [
  RichText(

      text:
      get(htmlContentQuestion, context)

  ),
],

                          ),
                          )),
                          collapsed: Container(
                          height: 0,
                          ),
                          expanded: Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Center(
                          child: RichText(
                          text: get(htmlContentanswer, context)),
                          ),
                          )),
                          ),
                                  SizedBox(height: 20,),
                                  Divider(thickness: 1,color: Color(0xffff6600),)
                              ],
                              ));


                        },
                        itemCount: f.faq!.data!.length,
                      ));
                    },
                    listener: (context, state) {}))
          ],
        ),
      ),
    );
  }

  TextSpan get(String htmlContent, context) {
    TextSpan textSpan = HTML.toTextSpan(
      context,
      htmlContent,
      linksCallback: (dynamic link) {
        debugPrint('You clicked on ${link.toString()}');
      },
      // as name suggests, optionally set the default text style
      defaultTextStyle: TextStyle(color: Colors.grey[700]),
    );
    return textSpan;
  }
}
