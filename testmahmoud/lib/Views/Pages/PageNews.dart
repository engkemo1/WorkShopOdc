import 'package:flutter/material.dart';
import 'package:testmahmoud/Views/Component/Editbutton.dart';
import 'package:testmahmoud/Views/Component/edittext.dart';
import 'dart:ui';
class PageNews extends StatelessWidget {
  const PageNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_back,
                            color: Colors.deepOrange, size: 25)),
                    EditText(
                      text: "News",
                      color: Colors.black,
                      fontsize: 25.0,
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
                        Image.network(
                          "https://ichef.bbci.co.uk/news/800/cpsprodpb/2357/production/_125574090_3f78a715-a205-4e81-9e30-7e8aee7e6260.jpg.webp",
                          height: height * .3,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SingleChildScrollView(
                            child: Text(
                          "Nottingham Forest defender Gaetan Bong has been suspended for three games after admitting a Football Association charge of violent conduct.Bong was charged after a coming together with Coventry midfielder Callum O'Hare which was not spotted by referee James Linington or his assistants during Sunday's 2-1 Sky Bet Championship defeat at the Coventry Building Society Arena.An FA spokesperson said:Gaetan Bong will be suspended for Nottingham Forest FC's next three matches following a breach of FA Rule E1.1.",
                          style: TextStyle(color: Colors.grey),
                        )),
                        SizedBox(height: height*.2,)
                        ,EditButton(icon: Icon(Icons.share,color: Colors.white,),
                          text: "Share",
                          width: width * .3,
                          color: Colors.white,
                          colorOfButton: Color(0xffff6600),
                          colorOfBorder:  Color(0xffff6600),onPressed: (){},
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
