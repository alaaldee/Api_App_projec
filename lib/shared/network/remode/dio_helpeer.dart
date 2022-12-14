

import 'package:dio/dio.dart';

class DioHelpeer {
  static late Dio dio; // انشاء oop
  //                من Dio
  static init() {
    //Method
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> query,
  }) async {
    return await dio.get(
      url,
      queryParameters: query,
    );
  }
}
