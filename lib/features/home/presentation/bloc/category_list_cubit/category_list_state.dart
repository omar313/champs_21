part of 'category_list_cubit.dart';

abstract class CategoryListState extends Equatable {
  const CategoryListState();

  @override
  List<Object> get props => [];
}

class CategoryListLoading extends CategoryListState {}

class CategoryListLoaded extends CategoryListState{
  final List<Post>  posts;

  CategoryListLoaded(this.posts);

    @override
  List<Object> get props => [this.posts];
}
