import 'package:flutter/material.dart';
import 'package:news_app/cubit/news_cubit.dart';

class ArticleBuilder extends StatelessWidget {
  ArticleBuilder({
    @required this.model,
  });

  final Map model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        color: Colors.grey.shade50,
        child: Row(
          children: [
            Container(
              height: NewsCubit.getHeight(context) * 0.18,
              width: NewsCubit.getWidth(context) * 0.4,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: model['urlToImage'] == null
                        ? AssetImage('assets/images/no_image.png')
                        : NetworkImage(
                            model['urlToImage'],
                          ),
                    fit: BoxFit.fill,
                  )),
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                  top: 5.0,
                  bottom: 2.0,
                ),
                height: NewsCubit.getHeight(context) * 0.18,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        model['title'],
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      model['publishedAt'],
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 17.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
