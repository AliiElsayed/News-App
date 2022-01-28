import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/news_cubit.dart';
import 'package:news_app/cubit/news_states.dart';

class NewsHomeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getWantedData('sports'),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var usedCubit = NewsCubit.getObj(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('News App'),
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.search,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            body: usedCubit.screens[usedCubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: usedCubit.currentIndex,
              onTap: (index) {
                usedCubit.onBottomNavBarTabbed(index);
              },
              items: usedCubit.bottomItems,
            ),
          );
        },
      ),
    );
  }
}
