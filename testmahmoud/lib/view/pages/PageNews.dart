import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:testmahmoud/Views/Component/Editbutton.dart';
import 'package:testmahmoud/Views/Component/edittext.dart';
import 'dart:ui';

import '../../Models/NewsModel.dart';
class PageNews extends StatelessWidget {
final Data data;

  const PageNews({ required this.data});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child:ConditionalBuilder(condition: data !=null,fallback: (context)=>Center(child: CircularProgressIndicator(),), builder: (BuildContext context) { return
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {Navigator.pop(context);},
                          icon: Icon(Icons.arrow_back,
                              color: Colors.deepOrange, size: 25)),
                      EditText(
                        text: "News",
                        color: Colors.black,
                        fontsize: 20.0,
                        fontwight: FontWeight.bold,
                      ),
                      Container(
                        width: width * .16,
                      ),
                    ],
                  ),
                  Container(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Container(

                            decoration: BoxDecoration(color: Colors.white.withOpacity(0),boxShadow: [BoxShadow(
                                blurRadius: 3,color: Colors.grey.withOpacity(0.5)
                            )]),
                            child:                        ClipRRect(child:
                            Image.network(
                              data.imageUrl.toString(),
                            ),borderRadius: BorderRadius.circular(20),),

                          ),

                          Row(children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10,top: 10),
                              child: Text(
                                data.title.toString(),
                                style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                            mainAxisAlignment: MainAxisAlignment.start,),

                          Row(children: [
                            Padding(
                              padding: EdgeInsets.only(top: 5,left: 10,right: 10,bottom: 20),
                              child: Text(
                                  data.date.toString(),
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xffff6600))),
                            ),

                          ],),
                          SizedBox(
                            height: 10,
                          ),
                          SingleChildScrollView(
                              child: Text(
                                data.body.toString(),
                                style: TextStyle(color: Colors.grey),
                              )),
                          SizedBox(height: height*.4,)
                          ,EditButton(icon: Icon(Icons.share,color: Colors.white,),
                            text: "Share",
                            width: width * .3,
                            color: Colors.white,
                            colorOfButton: Color(0xffff6600),
                            colorOfBorder:  Color(0xffff6600),onPressed: ()async{
                              final box = context.findRenderObject() as RenderBox?;

                              await Share.share(
                                data.linkUrl.toString(),
                                subject: '',
                                sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },)

        ),
      ),
    );
  }
}
