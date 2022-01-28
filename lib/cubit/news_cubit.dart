import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/network/dio_helper/dio_helper.dart';
import 'package:news_app/screens/business_screen.dart';
import 'package:news_app/screens/science_screen.dart';
import 'package:news_app/screens/settings_screen.dart';
import 'package:news_app/screens/sporst_screen.dart';
import 'news_states.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit getObj(context) => BlocProvider.of(context);
  static getHeight(context) => MediaQuery.of(context).size.height;
  static getWidth(context) => MediaQuery.of(context).size.width;
  int currentIndex = 0;
  List<dynamic> sportsData = [];
  List<dynamic> businessData = [];
  List<dynamic> scienceData = [];
  List<Widget> screens = [
    SportsNews(),
    BusinessNews(),
    ScienceNews(),
    Settings(),
  ];
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.sports_baseball),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Settings',
    ),
  ];

  onBottomNavBarTabbed(int index) {
    currentIndex = index;
    emit(NewsBottomNavBarChangeState());
    if (index == 0) {
      getWantedData('sports');
    } else if (index == 1) {
      getWantedData('business');
    } else if (index == 2) {
      getWantedData('business');
    } else {}
  }

  getWantedData(String wantedCategory) {
    DioHelper.getData(
      methodUrl: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': '$wantedCategory',
        'apiKey': '70fc98e222f3492dafa85c0991a7e107',
      },
    ).then((response) {
      emit(NewsGetDataSuccessState());
      if (wantedCategory == 'sports') {
        sportsData = response.data['articles'];
      } else if (wantedCategory == 'business') {
        businessData = response.data['articles'];
      } else {
        scienceData = response.data['articles'];
      }
    }).catchError((error) {
      emit(
        NewsGetDataErrorState(
          error.toString(),
        ),
      );
      print(error.toString());
    });
  }
}
