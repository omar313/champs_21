import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:champs_21/constants/app_data.dart';
import 'package:champs_21/features/home/domain/entity/category_model.dart';
import 'package:champs_21/features/home/domain/entity/post_model.dart';
import 'package:champs_21/features/home/domain/usecase/get_posts_by_category.dart';
import 'package:equatable/equatable.dart';
import 'package:champs_21/injection_container.dart';

part 'category_list_state.dart';

class CategoryListCubit extends Cubit<CategoryListState> {
  final categoriesMap = HashMap<int, List<Post>>();
  final categories = di.get<AppConstantData>().categories;
  CategoryListCubit() : super(CategoryListStateLoading());

  void requestPostsByCategory(int position) async {
    emit(CategoryListStateLoading());
    try {
      var posts = <Post>[];
      final id = categories[position].id;
      if (categoriesMap.containsKey(id)) {
        posts = categoriesMap[id];
      } else {
        posts = await di.get<GetPostsByCategory>().postByCategory(id);
        categoriesMap[id] = posts;
      }

      final tempList = <Post>[];
      tempList.addAll(posts);

      posts.addAll(tempList);
      posts.addAll(tempList);
      posts.addAll(tempList);
      posts.addAll(tempList);
      posts.addAll(tempList);
      posts.addAll(tempList);

      emit(CategoryListStateLoaded(posts));
    } catch (e) {
      emit(CategoryListError(e.toString()));
    }
  }
}
