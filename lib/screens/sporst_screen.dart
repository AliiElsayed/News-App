import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/news_cubit.dart';
import 'package:news_app/cubit/news_states.dart';
import 'package:news_app/widgets/view_all_data.dart';

class SportsNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var usedCubit = NewsCubit.getObj(context);
        return (state is NewsGetDataLoadingState)
            ? Center(child: CircularProgressIndicator())
            : AllDataBuilder(
                allRetrievedData: usedCubit.sportsData,
              );
      },
    );
  }
}
