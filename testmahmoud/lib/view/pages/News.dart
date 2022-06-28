import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testmahmoud/ViewModel/news_cuibt/NewsCuibt.dart';
import 'package:testmahmoud/ViewModel/news_cuibt/NewsState.dart';
import 'package:testmahmoud/Views/Component/constant.dart';
import 'package:testmahmoud/view/pages/PageNews.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'News',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          BlocProvider(
            create: (context) => NewsCubit()..getNews(),
            child: BlocConsumer<NewsCubit, NewsStates>(
              listener: (BuildContext context, state) {},
              builder: (BuildContext context, state) {
                var data = NewsCubit.get(context);
                return ConditionalBuilder(
                  fallback: (BuildContext context) => Center(
                    child: CircularProgressIndicator(
                      color: orange,
                    ),
                  ),
                  condition: NewsCubit.get(context).news != null,
                  builder: (context) {
                    return Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: data.news!.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => PageNews(
                                          data: data.news!.data![index])));
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 5, color: Colors.grey),
                                  ]),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Container(
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 5,
                                                offset: Offset(0, 5),
                                                color: orange
                                                    .withOpacity(0.1),
                                              ),
                                            ],
                                            color:
                                                Colors.white.withOpacity(0.1),
                                          ),
                                          child: ClipRRect(
                                            child: Image.network(
                                              data.news!.data![index].imageUrl
                                                  .toString(),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ))),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10, top: 10),
                                    child: Text(
                                      data.news!.data![index].title.toString(),
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                        data.news!.data![index].date.toString(),
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xffff6600))),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),

                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    )));
  }
}
