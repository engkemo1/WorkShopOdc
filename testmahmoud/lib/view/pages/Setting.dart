
import 'package:flutter/material.dart';
import 'package:testmahmoud/database/local/cache_helper.dart';
import 'package:testmahmoud/view/pages/FaqScreen.dart';
import 'package:testmahmoud/view/pages/Partners.dart';
import 'package:testmahmoud/view/pages/Support.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'Login.dart';
import 'Terms.dart';
class Setting extends StatelessWidget {
  var data=[
    { 'images/faq.png','FAQ'},
    {'images/terms.png','Terms'},
    { 'images/privacy.png','Our Partners'},
    { 'images/suport.png','Support'},
    { 'images/logout.png','Logout'}



  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(centerTitle: true,backgroundColor: Colors.white,elevation: 0,
      title:  Text(
        'Setting',
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        textAlign: TextAlign.center,
      ),) ,
      body: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.1,left: 10,right: 10),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: data.length,
            itemBuilder: (BuildContext ctx, index) {
              return GestureDetector(
                onTap: (){

                   if(index==0){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => FAQScreen()));
                  } else if(index==1){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => About()));
                  }else if(index==2){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Partners()));
                  }else if(index==3){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Support()));
                  }else if(index==4){
                     AwesomeDialog(
                       context: context,
                       dialogType: DialogType.NO_HEADER,
                       animType: AnimType.BOTTOMSLIDE,

                       title: '',

                       desc: "Do you want to logout ?",
                       btnOkColor: Colors.green,
                       btnOkOnPress: () {
                         CacheHelper.clearData();
                         Navigator.pushReplacement(
                             context, MaterialPageRoute(builder: (_) => Login()));
                       },
                      btnCancelOnPress:(){},
                      btnCancelColor: Colors.red
                     ).show();

                  }else{
                     return null;
                   }



                },
                child:

                Card(

                child: Column(mainAxisAlignment:MainAxisAlignment.center,children: [

                  Container(height: 61,width: 61,decoration: BoxDecoration(shape: BoxShape.circle,color: Color(0xffff6600),),
                    child:
                    Image.asset(data[index].first),

                  ),
                  SizedBox(height: 10,),
                  Text(data[index].last)

                ],),
              ));
            }),
      ),
    );
  }
}
