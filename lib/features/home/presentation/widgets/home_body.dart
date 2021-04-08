import 'package:champs_21/features/home/domain/entity/category_model.dart';
import 'package:champs_21/features/home/domain/entity/post_model.dart';
import 'package:champs_21/features/home/presentation/bloc/category_list_cubit/category_list_cubit.dart';
import 'package:champs_21/features/home/presentation/widgets/pic_slider.dart';
import 'package:flutter/material.dart';

import 'categories.dart';
import 'indicator_slider.dart';
import 'news_list_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({
    Key key,
    @required this.categories,
    @required this.posts,
  }) : super(key: key);

  final List<CategoryModel> categories;
  final List<Post> posts;

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final _scrollController = ScrollController();
  @override
  void initState() { 
    super.initState();
     _scrollController.addListener(() {
    if(_scrollController.position.atEdge){
      if(_scrollController.position.pixels != 0){
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
    //   mainAxisSize: MainAxisSize.min,
    //   children: [
    //     PicSlider(posts: posts,),
    //     IndicatorSlider(count: posts.length,),
    //     Categories(categories: categories),
    //     NewsListView(),
    //   ],
    // );

    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverPersistentHeader(
          pinned: false,
          delegate: PersistentHeader(
              widget: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.topCenter ,
                      child: PicSlider(
                        posts: widget.posts,
                      ),
                    ),
                  ),
                  IndicatorSlider(
                    count: widget.posts.length,
                  ),
                ],
              ),
              size: size.height * 0.32),
        ),
        SliverPersistentHeader(
            pinned: true,
            delegate: PersistentHeader(
                widget: Categories(
                  categories: widget.categories,
                ),
                size: 75.0)),
        NewsListView(),
      ],
    );

    // return NestedScrollView(headerSliverBuilder: (context, isInnerScrolled) {
    //   return [
    //     SliverPersistentHeader(
    //       pinned: false,
    //       delegate: PersistentHeader(
    //           widget: Column(
    //             children: [
    //               Flexible(
    //                 child: PicSlider(
    //                   posts: posts,
    //                 ),
    //               ),
    //               IndicatorSlider(
    //                 count: posts.length,
    //               ),
    //             ],
    //           ),
    //           size: size.height * 0.33),
    //     ),
    //     SliverOverlapAbsorber(
    //       handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
    //       sliver: SliverPersistentHeader(
    //           pinned: true,
    //           delegate: PersistentHeader(
    //               widget: Categories(
    //                 categories: categories,
    //               ),
    //               size: 75.0)),
    //     ),
    //   ];
    // }, body: Builder(
    //   builder: (context) {
    //     return CustomScrollView(
    //       slivers: [NewsListView()],
    //     );
    //   },
    // ));
  }
}

class PersistentHeader extends SliverPersistentHeaderDelegate {
  final Widget widget;
  final double size;

  PersistentHeader({
    this.widget,
    this.size,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // return Container(
    //   width: double.infinity,
    //   height: 56.0,
    //   child: Card(
    //     margin: EdgeInsets.all(0),
    //     color: Colors.white,
    //     elevation: 5.0,
    //     child: Center(child: widget),
    //   ),
    // );
    return widget;
  }

  @override
  double get maxExtent => size;

  @override
  double get minExtent => size;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
