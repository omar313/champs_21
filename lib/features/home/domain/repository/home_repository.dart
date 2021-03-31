import 'package:champs_21/features/home/domain/entity/category_model.dart';
import 'package:champs_21/features/home/domain/entity/post_model.dart';

abstract class HomeRepository{
  List<CategoryModel> getCategories();
  Future<List<Post>> getRecentPost();
}