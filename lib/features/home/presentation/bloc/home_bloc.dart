import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:champs_21/features/home/domain/entity/category_model.dart';
import 'package:champs_21/features/home/domain/entity/post_model.dart';
import 'package:champs_21/features/home/domain/usecase/get_recent_post.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetRecentPost getRecentPost;
  HomeBloc(this.getRecentPost) : super(HomeStateInitial());

  List<Post> recentPosts;
  int selectedCategoryPosition = 0;

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is HomeEventInitial) {
      yield HomeStateInitial();
      try {
        if (recentPosts == null) {
          recentPosts = await getRecentPost.recentPosts();
           yield HomeStatePostLoaded(recentPosts);
        }else{
           yield HomeStatePostLoaded(recentPosts);
          yield HomeStateCategoryLoad(selectedCategoryPosition);
        }
       
       
      } catch (e) {
        yield HomeStateError(e.toString());
      }
    } else if (event is HomeEventTapDrawerCategory) {
      yield HomeStateCategoryFullPageLoad(event.categoryModel);
    } else if (event is HomeEventTapCategory) {
      selectedCategoryPosition = event.position;
      yield HomeStateCategoryLoad(event.position);
    } else if (event is HomeEventTapNews) {
      yield HomeStateNewsDetailLoad(event.categoryModel, event.post);
    }
  }
}
