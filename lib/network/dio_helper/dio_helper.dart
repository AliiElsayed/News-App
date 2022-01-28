import 'package:dio/dio.dart';

class DioHelper {
  static Dio dio;
  static initDio() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org',
      ),
    );
  }

  static Future<Response> getData(
      {String methodUrl, Map<String, dynamic> query}) async {
    return await dio.get(methodUrl, queryParameters: query);
  }
}
