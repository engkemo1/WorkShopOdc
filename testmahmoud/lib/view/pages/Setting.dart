
import 'package:flutter/material.dart';
import 'package:testmahmoud/database/local/cache_helper.dart';

import 'Login.dart';
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
                  if(index==4)
                  CacheHelper.clearData();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>Login()));
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
