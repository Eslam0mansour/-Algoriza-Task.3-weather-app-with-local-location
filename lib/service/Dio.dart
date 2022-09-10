import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      //https://api.weatherapi.com/v1/forecast.json?key=3abc4ac71f114deb86380405201809&q=Cairo&days=1&aqi=no&alerts=no
      BaseOptions(
        baseUrl: 'https://api.weatherapi.com/v1',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getDate({
    required String url,
    required Map<String, dynamic> query,
  }) async {
    return await dio.get(url, queryParameters: query);
  }
}
