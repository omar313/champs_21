import 'package:champs_21/features/home/domain/entity/category_model.dart';
import 'package:champs_21/features/home/domain/entity/post_model.dart';
import 'package:champs_21/features/home/presentation/widgets/pic_slider.dart';
import 'package:flutter/material.dart';

import 'categories.dart';
import 'indicator_slider.dart';
import 'news_list_view.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    Key key,
    @required this.categories, @required this.posts,
  }) : super(key: key);

  final List<CategoryModel> categories;
  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        PicSlider(posts: posts,),
        IndicatorSlider(count: posts.length,),
        Categories(categories: categories),
        NewsListView(posts: posts,),
      ],
    );
  }
}