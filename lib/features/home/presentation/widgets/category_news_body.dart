import 'package:champs_21/constants/app_data.dart';
import 'package:champs_21/features/home/domain/entity/category_model.dart';
import 'package:champs_21/features/home/presentation/bloc/category_list_cubit/category_list_cubit.dart';
import 'package:champs_21/features/home/presentation/bloc/home_bloc.dart';
import 'package:champs_21/features/home/presentation/widgets/pagination_loader.dart';
import 'package:flutter/material.dart';
import '../../../../injection_container.dart';
import 'category_body_header.dart';
import 'category_body_top_image.dart';
import 'item_news.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryNewsBody extends StatefulWidget {
  const CategoryNewsBody({Key key, @required this.categoryModel})
      : super(key: key);
  final CategoryModel categoryModel;

  @override
  _CategoryNewsBodyState createState() => _CategoryNewsBodyState();
}

class _CategoryNewsBodyState extends State<CategoryNewsBody> {
  final _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels != 0) {
          context.read<CategoryListCubit>().requestNewPage();
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

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
        CategoryBodyHeader(
            imagePath: widget.categoryModel.imagePath,
            name: widget.categoryModel.name),
        Expanded(
          child:
              // SliverFillRemaining(
              //   child: ListView.builder(
              //       physics: NeverScrollableScrollPhysics(),
              //       shrinkWrap: true,
              //       itemCount: 20,
              //       itemBuilder: (context, position) {
              //         return ItemNews();
              //       }),
              // ),
              //

              BlocBuilder<CategoryListCubit, CategoryListState>(
            builder: (context, state) {
              if (state is CategoryListStateLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is CategoryListStateLoaded) {
                return CustomScrollView(
                  controller: _scrollController,
                  physics: BouncingScrollPhysics(),
                  slivers: [
                    CategoryBodyTopImage(post: state.posts[0]),
                    SliverList(
                      delegate: SliverChildBuilderDelegate((context, position) {
                        return position >= state.posts.length
                            ? PaginationLoader()
                            : GestureDetector(
                                child: ItemNews(
                                  shortDescription:
                                      state.posts[position].content,
                                  title: state.posts[position].title,
                                  imageUrl: state.posts[position].featureImage,
                                ),
                                onTap: () {
                                  context.read<HomeBloc>().add(HomeEventTapNews(
                                      widget.categoryModel,
                                      state.posts[position]));
                                  // context.read<HomeBloc>().add(HomeEventTapNews(
                                  //     di.get<AppConstantData>().getCategories()[0],
                                  //     state.posts[position]));
                                },
                              );
                      }, childCount: state.posts.length + 1),
                    ),
                  ],
                );
              } else if (state is CategoryListError) {
                return Center(child: Text(state.error));
              }
            },
          ),

          // SliverList(delegate: SliverChildBuilderDelegate(
          //   (context, position){
          //   return GestureDetector(child: ItemNews(shortDescription: '', title: '', imageUrl: '',), onTap: (){
          //     context.read<HomeBloc>().add(HomeEventTapNews(categoryModel , null));
          //   },);
          // }, childCount: 20))
        ),
      ],
    );
  }
}

