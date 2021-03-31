import 'package:champs_21/features/home/data/repository/home_repository_impl.dart';
import 'package:champs_21/features/home/domain/entity/post_model.dart';
import 'package:champs_21/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'item_news.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({
    Key key,
    this.posts,
  }) : super(key: key);

  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, position) {
            return GestureDetector(
              child: ItemNews(
                shortDescription: posts[position].excerpt.rendered,
                title: posts[position].title.rendered,
                imageUrl: posts[position].featureImage,
              ),
              onTap: () {
                context.read<HomeBloc>().add(HomeEventTapNews(
                    HomeRepositoryImpl().getCategories()[0], posts[position]));
              },
            );
          }),
    );
  }
}
