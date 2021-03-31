import 'package:champs_21/features/home/domain/entity/post_model.dart';
import 'package:champs_21/features/home/domain/repository/home_repository.dart';

abstract class GetRecentPost{
  Future<List<Post>> recentPosts();
}

class GetRecentPostImpl implements GetRecentPost{
  final HomeRepository homeRepository;

  GetRecentPostImpl(this.homeRepository);
  @override
  Future<List<Post>> recentPosts() {
    return homeRepository.getRecentPost();
  }

}