import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/layout/home/cubits/cubit.dart';
import 'package:la_vie/layout/home/cubits/states.dart';
import 'package:la_vie/modulrs/splash/splash_screen.dart';
import 'package:la_vie/shared/bloc_observer.dart';
import 'package:la_vie/shared/components/constant.dart';
import 'package:la_vie/shared/network/local/cache_helper.dart';
import 'package:la_vie/shared/style/themes/theme.dart';

import 'shared/network/remote/dio_helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocOverrides.runZoned(
    () async {
      DioHelper.init();
      await CacheHelper.init();
      accessToken = CacheHelper.getData(key: 'accessToken');
      print('${accessToken} Bishooo');

      runApp(MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => LavieCubit()
            ..getProductData()
            ..getPlantsData()
            ..getSpeedsData()
            ..getToolsData()
            ..getBlogsData()
            ..getBlogsSearchData()
            ..getFormus()
            ..getUserData(),
        ),
      ],
      child: BlocConsumer<LavieCubit, LavieStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
