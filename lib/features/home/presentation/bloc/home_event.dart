part of 'home_bloc.dart';

abstract class HomeEvent  {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeEventInitial extends HomeEvent{}

class HomeEventTapDrawerCategory extends HomeEvent{
  final CategoryModel categoryModel;

  HomeEventTapDrawerCategory(this.categoryModel);
  @override
  List<Object> get props => [this.categoryModel];
}

class HomeEventTapCategory extends HomeEvent{
  final CategoryModel categoryModel;

  HomeEventTapCategory(this.categoryModel);
  @override
  List<Object> get props => [this.categoryModel];
}

class HomeEventTapNews extends HomeEvent{
  final CategoryModel categoryModel;
  final Post post;

  HomeEventTapNews(this.categoryModel, this.post);
  @override
  List<Object> get props => [this.categoryModel, this.post];
}


