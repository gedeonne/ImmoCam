import 'package:dio/dio.dart';
import 'package:get/get.dart';

class BaseApi extends GetxService{
  late Dio _dio;
  String baseUrl = "http://127.0.0.1:8000/api/v1";
  @override
  void onInit() {
    // TODO: implement onInit
    initialization();
    super.onInit();
  }

  void initialization(){
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: Duration(seconds: 30),
        receiveTimeout: Duration(seconds: 30),
        responseType: ResponseType.json,
      )
    );

  }
}