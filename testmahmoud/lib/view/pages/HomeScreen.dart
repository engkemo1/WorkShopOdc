import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  var data = [
    {'images/Open Book.png', 'Lectures'},
    {'images/section.png', 'Sections'},
    {'images/events.png', 'Events'},
    {'images/mid.png', 'Midterm'},
    {'images/test.png', 'Finals'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              child: RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 20),
                  children: const <TextSpan>[
                    TextSpan(
                        text: 'Orange',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xffff6600))),
                    TextSpan(
                        text: ' Digital Center',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black)),
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 200,
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.1,
                  left: 10,
                  right: 10),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: data.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 61,
                            width: 61,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xffff6600),
                            ),
                            child: Image.asset(data[index].first),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(data[index].last)
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
