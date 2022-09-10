import 'package:dio/dio.dart';

class DioHelper2 {
  static late Dio dioo;

  static init2() {
    dioo = Dio(

      BaseOptions(
        baseUrl: 'https://api.openweathermap.org/geo/1.0',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getDate2({
    required String url,
    required Map<String, dynamic> query,
  }) async {
    return await dioo.get(url, queryParameters: query);
  }
}
