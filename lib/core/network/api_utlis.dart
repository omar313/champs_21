import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

class ApiUtil{
  final dio = Dio();

  ApiUtil(){
   /* (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };*/
    dio.options.baseUrl = 'https://champs21.com/wp-json/wp/v2/';
    dio.interceptors.add(DioCacheManager(CacheConfig(baseUrl: 'https://champs21.com/wp-json/wp/v2/')).interceptor);
     dio.options.responseType = ResponseType.plain;
    
  }
 
}