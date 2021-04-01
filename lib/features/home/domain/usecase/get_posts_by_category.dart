import 'package:champs_21/features/home/domain/entity/post_model.dart';
import 'package:champs_21/features/home/domain/repository/home_repository.dart';

abstract class GetPostsByCategory {
  Future<List<Post>> postByCategory(int id );
}

class GetPostsByCategoryImpl extends GetPostsByCategory{
  final HomeRepository _homeRepository;

  GetPostsByCategoryImpl(this._homeRepository);
  @override
  Future<List<Post>> postByCategory(int id) {
    return _homeRepository.getPostByCategory(id);
  }

}