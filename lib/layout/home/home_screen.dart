import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/layout/home/cubits/cubit.dart';
import 'package:la_vie/layout/home/cubits/states.dart';

import 'BotNavBar.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();
  // final int index = 2;

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LavieCubit, LavieStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LavieCubit.get(context);
        return Scaffold(
          extendBody: true, // الصفحة دي ثابتة صح

          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BotNavBar(cubit: cubit),
        );
      },
    );
  }
}
