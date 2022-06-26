import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../ViewModel/BottomNavBarCubit/BottomNavBarCubit.dart';
import '../../ViewModel/BottomNavBarCubit/BottomNavBarState.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return BottomNavBarCubit();
      },
      child: BlocConsumer<BottomNavBarCubit,MainState>(listener: (BuildContext context, state) {  }, builder: (BuildContext context, Object? state) { return Scaffold(
        body: BottomNavBarCubit.get(context).screenList[BottomNavBarCubit.get(context).index],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: BottomNavBarCubit.get(context).index,
          items: [
            buildBottomNavigationBarItem(
                Icon(Icons.home_outlined), Text('Home')),
            buildBottomNavigationBarItem(
                Icon(Icons.newspaper_outlined), Text('News')),
            buildBottomNavigationBarItem(
                Icon(Icons.settings_outlined), Text('Setting'))
          ],
          onTap: (index) {
            BottomNavBarCubit.get(context).change(index);
          },
        ),
      ); },)
    );
  }
}

BottomNavigationBarItem buildBottomNavigationBarItem(
  Widget icon,
  Widget activeIcon,
) {
  return BottomNavigationBarItem(
    backgroundColor: Colors.white,
    activeIcon: activeIcon,
    icon: icon,
    label: "",
  );
}
