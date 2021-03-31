import 'dart:convert';

import 'package:champs_21/constants/strings.dart';
import 'package:champs_21/core/network/api_utlis.dart';
import 'package:champs_21/features/home/domain/entity/category_model.dart';
import 'package:champs_21/features/home/domain/entity/post_model.dart';
import 'package:champs_21/features/home/domain/repository/home_repository.dart';

import '../../../../injection_container.dart';

class HomeRepositoryImpl implements HomeRepository {
@override 
  List<CategoryModel> getCategories() {
    final categories = <CategoryModel>[];
    categories
        .add(CategoryModel(name: 'খবর', imagePath: 'assets/images/news.svg',id: 139));
    categories
        .add(CategoryModel(name: 'বিজ্ঞানপ্রযুক্তি', imagePath: 'assets/images/technology.svg',id: 142 ));
    categories
        .add(CategoryModel(name: 'অ্যাপস ও গেইমস', imagePath: 'assets/images/game.svg',id: 177 ));
    categories
        .add(CategoryModel(name: 'চ্যাম্পিয়ন', imagePath: 'assets/images/cup.svg',id: 154));
    categories
        .add(CategoryModel(name: 'জীবনযাত্রা', imagePath: 'assets/images/lifestyle.svg',id: 133));
    categories
        .add(CategoryModel(name: 'রিসোর্স সেন্টার', imagePath: 'assets/images/resource_center.svg',id: 144));
    categories
        .add(CategoryModel(name: 'খেলাধুলা', imagePath: 'assets/images/sport.svg',id: 172));
    categories
        .add(CategoryModel(name: 'বিনোদন', imagePath: 'assets/images/entertainment.svg',id: 168));
    categories
        .add(CategoryModel(name: 'ভিডিও', imagePath: 'assets/images/video.svg',id: 138));

        return categories;
  }

 

  @override
  Future<List<Post>> getRecentPost() async{
    final dio =  di.get<ApiUtil>().dio;
    final response = await dio.get('posts?_embed');
    print(response.toString());

    if(response.statusCode == 200){
      return  _parseRecentPost(response.toString());
    }else{
     return Future.error(kServerErrorMsg);
    }

  }

    static Future<List<Post>> _parseRecentPost(String response) {
    final List jsonObj = json.decode(response);

    final posts = jsonObj.map((item) => Post.fromJson(item)).toList();
    return Future.value(posts);

  
  }
  
}
