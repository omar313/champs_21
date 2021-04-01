import 'dart:convert';

import 'package:champs_21/constants/strings.dart';
import 'package:champs_21/core/network/api_utlis.dart';
import 'package:champs_21/features/home/domain/entity/category_model.dart';
import 'package:champs_21/features/home/domain/entity/post_model.dart';
import 'package:champs_21/features/home/domain/repository/home_repository.dart';

import '../../../../injection_container.dart';

class HomeRepositoryImpl implements HomeRepository {
@override 
 

 

  @override
  Future<List<Post>> getRecentPost() async{
    final dio =  di.get<ApiUtil>().dio;
    final response = await dio.get('posts?_embed');
    print(response.toString());

    if(response.statusCode == 200){
      return  _parsePosts(response.toString());
    }else{
     return Future.error(kServerErrorMsg);
    }

  }

   

  @override
  Future<List<Post>> getPostByCategory(int id) async{
    final dio =  di.get<ApiUtil>().dio;
    final response = await dio.get('categories/$id');
    print(response.toString());

    if(response.statusCode == 200){
      return  _parsePosts(response.toString());
    }else{
     return Future.error(kServerErrorMsg);
    }

  }

   static Future<List<Post>> _parsePosts(String response) {
    final List jsonObj = json.decode(response);

    final posts = jsonObj.map((item) => Post.fromJson(item)).toList();
    return Future.value(posts);

  
  }
  
}
