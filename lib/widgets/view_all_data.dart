import 'package:flutter/material.dart';
import 'build_article.dart';

class AllDataBuilder extends StatelessWidget {
  final List allRetrievedData;

  AllDataBuilder({
    @required this.allRetrievedData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return ArticleBuilder(model: allRetrievedData[index]);
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemCount: allRetrievedData.length),
    );
  }
}
