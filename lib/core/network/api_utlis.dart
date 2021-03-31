import 'package:dio/dio.dart';

class ApiUtil{
  final dio = Dio();

  ApiUtil(){
    dio.options.baseUrl = 'https://champs21.com/wp-json/wp/v2/';
     dio.options.responseType = ResponseType.plain;
    
  }
 
}