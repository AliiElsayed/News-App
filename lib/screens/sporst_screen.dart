import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/news_cubit.dart';
import 'package:news_app/cubit/news_states.dart';
import 'package:news_app/widgets/build_article.dart';

class SportsNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var usedCubit = NewsCubit.getObj(context);
        return usedCubit.sportsData.isEmpty
            ? Center(child: CircularProgressIndicator())
            : Container(
                margin: EdgeInsets.all(10.0),
                child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ArticleBuilder(model: usedCubit.sportsData[index]);
                    },
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                    itemCount: usedCubit.sportsData.length),
              );
      },
    );
  }
}
