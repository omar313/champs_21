part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
  
  @override
  List<Object> get props => [];
}

class HomeStateInitial extends HomeState {}
class HomeStateCategoryFullPageLoad extends HomeState {
  final CategoryModel categoryModel;

  HomeStateCategoryFullPageLoad(this.categoryModel);
  @override
  List<Object> get props => [this.categoryModel];
}

class HomeStateCategoryLoad extends HomeState {
  final CategoryModel categoryModel;

  HomeStateCategoryLoad(this.categoryModel);
  @override
  List<Object> get props => [this.categoryModel];
}

class HomeStateNewsDetailLoad extends HomeState {
  final CategoryModel categoryModel;
  final Post post;

  HomeStateNewsDetailLoad(this.categoryModel, this.post);
  @override
  List<Object> get props => [this.categoryModel, this.post];
}


class HomeStatePostLoaded extends HomeState {
  final List<Post> posts;

  HomeStatePostLoaded(this.posts);
 @override
  List<Object> get props => [this.posts];

}

class HomeStateError extends HomeState{
  final String error;

  HomeStateError(this.error);

   @override
  List<Object> get props => [this.error];


}







