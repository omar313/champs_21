import 'package:champs_21/core/widgets/champs_app_bar.dart';
import 'package:champs_21/features/home/domain/entity/category_model.dart';
import 'package:champs_21/features/home/domain/entity/post_model.dart';
import 'package:champs_21/features/home/presentation/widgets/news_detail_body.dart';
import 'package:flutter/material.dart';

class NewsDetailPage extends StatelessWidget {
  const NewsDetailPage({Key key, @required this.categoryModel, @required this.post}) : super(key: key);
  final CategoryModel categoryModel;
  final Post post;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChampsAppBar(isShowDrawer: false,),
      body: NewsDetailBody(
        categoryModel: categoryModel,
        post: post,

      ),
    );
  }
}
