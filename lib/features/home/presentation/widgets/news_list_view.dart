import 'package:champs_21/constants/app_data.dart';
import 'package:champs_21/features/home/presentation/bloc/categories_button_cubit/categoriesbutton_cubit.dart';
import 'package:champs_21/features/home/presentation/bloc/category_list_cubit/category_list_cubit.dart';
import 'package:champs_21/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'item_news.dart';
import 'package:champs_21/injection_container.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryListCubit, CategoryListState>(
      builder: (context, state) {
        if (state is CategoryListStateLoading) {
          return SliverFillRemaining(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is CategoryListStateLoaded) {
          return SliverList(
            delegate: SliverChildBuilderDelegate((context, position) {
              return GestureDetector(
                child: ItemNews(
                  shortDescription: state.posts[position].content,
                  title: state.posts[position].title,
                  imageUrl: state.posts[position].featureImage,
                ),
                onTap: () {
                  context.read<HomeBloc>().add(HomeEventTapNews(
                      di.get<AppConstantData>().categories[0],
                      state.posts[position]));
                  // context.read<HomeBloc>().add(HomeEventTapNews(
                  //     di.get<AppConstantData>().getCategories()[0],
                  //     state.posts[position]));
                },
              );
            }, childCount: state.posts.length),
          );
        } else if (state is CategoryListError) {
          return SliverFillRemaining(child: Center(child: Text(state.error)));
        }
      },
    );
  }
}
