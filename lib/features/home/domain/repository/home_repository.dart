import 'package:champs_21/features/home/domain/entity/post_model.dart';

abstract class HomeRepository{
  Future<List<Post>> getRecentPost();
  Future<List<Post>> getPostByCategory(int id);
}