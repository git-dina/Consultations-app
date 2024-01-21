import 'package:dio/dio.dart';

import '../constants/global.dart';
class DioManager {
  late final Dio dio;

  DioManager._privateConstructor(){
    var headers = {
      'Content-Type': 'application/json',
      'accept': 'application/json'
    };
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        contentType:'application/json' ,
        responseType: ResponseType.plain,
        followRedirects: true,
        headers: headers,
        validateStatus: (int? status) {
          return status != null;
          // return status != null && status >= 200 && status < 300;
        },
      ),
    );
  }

  static final DioManager _instance = DioManager._privateConstructor();

  factory DioManager() {
    return _instance;
  }

}

