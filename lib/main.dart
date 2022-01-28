import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/cubit/bloc_observer.dart';
import 'package:news_app/network/dio_helper/dio_helper.dart';

import 'layout/news_home_layout.dart';

void main() {
  DioHelper.initDio();
  // Bloc.observer = MyBlocObserver();
  BlocOverrides.runZoned(
    () {
      // Use cubits...
      runApp(MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      //themeMode: ThemeMode.light,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          elevation: 0.0,
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 20.0),
          actionsIconTheme: IconThemeData(
            color: Colors.deepOrange,
          ),
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
        ),
        primarySwatch: Colors.deepOrange,
      ),
      home: NewsHomeLayout(),
    );
  }
}
