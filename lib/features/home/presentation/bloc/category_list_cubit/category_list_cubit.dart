import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'category_list_state.dart';

class CategoryListCubit extends Cubit<CategoryListState> {
  CategoryListCubit() : super(CategoryListInitial());
}
