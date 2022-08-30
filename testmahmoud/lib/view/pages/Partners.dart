import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testmahmoud/ViewModel/partners_cubit/PartnersCubit.dart';

import '../../ViewModel/partners_cubit/PartnersStates.dart';
import '../../Views/Component/constant.dart';

class Partners extends StatelessWidget {
  const Partners({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create:(context)=>PartnersCubit()..getPartners(),
    child: BlocConsumer<PartnersCubit,PartnersStates>(
        listener: (context,state){},
    builder: (context,state){
          var cubit= PartnersCubit.get(context);
          return

          ConditionalBuilder(
          fallback: (BuildContext context) => Center(
    child: CircularProgressIndicator(
    color: orange,
    ),
    ),
    condition: PartnersCubit.get(context).getPartners() != null,
    builder: (context) {
            return Scaffold(
          backgroundColor: Colors.grey,
          body: SafeArea(
          child: CustomScrollView(
          slivers: <Widget>[
          SliverAppBar(
          backgroundColor: Colors.white,

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
    child:(state is ! GetPartnersDetailsLoading)?Image.network(
        cubit.partnersModel!.data![index].imageUrl.toString()
    ):Container())
    ],
    ),
    );
    },
    childCount: cubit.partnersModel!.data!.length,
    ),
    ),
    ],
    ),
    )
    );},
            );
    },
    ),
    );
  }
}
