import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Partners extends StatelessWidget {
  const Partners({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
        body: SafeArea(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white.withOpacity(0.4),
            shadowColor: Colors.grey,
            title: Text(
              'Partners',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            centerTitle: true,
            elevation: 0,

            expandedHeight: MediaQuery.of(context).size.height * .3,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),

            )),
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(

              centerTitle: true,
              background: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
bottomRight: Radius.circular(50),
                      bottomLeft:  Radius.circular(50)
                    ),                    color: Colors.white,
                    boxShadow: [
                        BoxShadow(
                          color: Colors.grey, blurRadius: 1)
                    ]),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Image.network(
                      "https://www.memento.fr/photos/26885/vignette-26885.jpg",
                      fit: BoxFit.fill,
                      height: 200,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.all(20),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                            'https://vid.alarabiya.net/images/2020/12/18/f4bbb297-e0d6-43aa-928a-0bab82f9deac/f4bbb297-e0d6-43aa-928a-0bab82f9deac_16x9_1200x676.jpg?width=1138'),
                      )
                    ],
                  ),
                );
              },
              childCount: 5,
            ),
          ),
        ],
      ),
    ));
  }
}
