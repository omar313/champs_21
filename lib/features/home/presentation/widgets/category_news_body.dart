import 'package:champs_21/features/home/domain/entity/category_model.dart';
import 'package:champs_21/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'category_body_header.dart';
import 'category_body_top_image.dart';
import 'item_news.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class CategoryNewsBody extends StatelessWidget {
  const CategoryNewsBody({Key key, @required this.categoryModel})
      : super(key: key);
  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // return Column(
    //   children: [
    //     CategoryBodyHeader(categoryModel: categoryModel),
    //     Expanded(
    //       child: SingleChildScrollView(
    //         child: Column(
    //           children: [
    //             CategoryBodyBigImage(),
    //             ListView.builder(
    //                 physics: NeverScrollableScrollPhysics(),
    //                 shrinkWrap: true,
    //                 itemCount: 20,
    //                 itemBuilder: (context, position) {
    //                   return ItemNews();
    //                 }),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ],
    // );

    return Column(
      children: [
        CategoryBodyHeader(imagePath: categoryModel.imagePath, name: categoryModel.name),
        Expanded(
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              CategoryBodyTopImage(),
              // SliverFillRemaining(
              //   child: ListView.builder(
              //       physics: NeverScrollableScrollPhysics(),
              //       shrinkWrap: true,
              //       itemCount: 20,
              //       itemBuilder: (context, position) {
              //         return ItemNews();
              //       }),
              // ),

              SliverList(delegate: SliverChildBuilderDelegate(
                (context, position){
                return GestureDetector(child: ItemNews(shortDescription: '', title: '', imageUrl: '',), onTap: (){
                  context.read<HomeBloc>().add(HomeEventTapNews(categoryModel , null));
                },);
              }, childCount: 20))
            ],
          ),
        ),
      ],
    );
  }
}

