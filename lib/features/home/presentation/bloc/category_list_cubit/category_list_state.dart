part of 'category_list_cubit.dart';

abstract class CategoryListState extends Equatable {
  const CategoryListState();

  @override
  List<Object> get props => [];
}

class CategoryListStateLoading extends CategoryListState {}

class CategoryListError extends CategoryListState {
  final String error;

  CategoryListError(this.error);
   @override
  List<Object> get props => [this.error];
  
}

class CategoryListStateLoaded extends CategoryListState{
  final List<Post>  posts;

  CategoryListStateLoaded(this.posts);

    @override
  List<Object> get props => [this.posts];
}
