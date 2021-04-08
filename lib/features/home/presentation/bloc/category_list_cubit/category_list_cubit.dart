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
  final pageNumberMap = HashMap<int, int>();
  var currentCategoryID;
  bool isNewRequestRuning = false;
  CategoryModel selectedCategory;

  final categories = di.get<AppConstantData>().categories;
  CategoryListCubit() : super(CategoryListStateLoading());

  void requestPostsByCategory(int position) async {
    emit(CategoryListStateLoading());
    try {
      var posts = <Post>[];
      currentCategoryID = categories[position].id;
      selectedCategory = categories[position];

      if (categoriesMap.containsKey(currentCategoryID)) {
        posts = categoriesMap[currentCategoryID];
      } else {
        posts = await di
            .get<GetPostsByCategory>()
            .postByCategory(currentCategoryID, 1);
        pageNumberMap[currentCategoryID] = 1;
        categoriesMap[currentCategoryID] = posts;
      }

      // final tempList = <Post>[];
      // tempList.addAll(posts);

      // posts.addAll(tempList);
      // posts.addAll(tempList);
      // posts.addAll(tempList);
      // posts.addAll(tempList);
      // posts.addAll(tempList);
      // posts.addAll(tempList);

      emit(CategoryListStateLoaded(posts,categories[position]));
    } catch (e) {
      emit(CategoryListError(e.toString()));
    }
  }

  void requestNewPage() async {
    if (isNewRequestRuning) {
      return;
    }

    print('current category id: $currentCategoryID');
    var pageNumber = pageNumberMap[currentCategoryID];
    print('page number $pageNumber');
    pageNumber = pageNumber + 1;

    try {
      isNewRequestRuning = true;
      final newPosts = await di
          .get<GetPostsByCategory>()
          .postByCategory(currentCategoryID, pageNumber);

      final posts = categoriesMap[currentCategoryID];

      posts.addAll(newPosts);

      emit(CategoryListStateLoaded(posts, selectedCategory ));
      isNewRequestRuning = false;
      pageNumberMap[currentCategoryID] = pageNumber;
    } catch (e) {
      isNewRequestRuning = false;
    }
  }
}
