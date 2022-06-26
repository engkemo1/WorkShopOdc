import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioHelper {
  static Dio? dio;

  static inti() {
    dio = Dio(BaseOptions(
        baseUrl: "http://workshop.orangedigitalcenteregypt.com/api/v1/",
        receiveDataWhenStatusError: true));
  }

  static Future<Response> PostData(
      {required String url,
      required Map<String, dynamic> data,
      String? token}) async {
    print("mahmoud hossam ------------------------\n");

    dynamic recieveData = await dio?.post(url, data: data);

    print("is--------------------------\n");
    print("${recieveData}-----------------------\n");
    return recieveData;
  }

  static Future<Response> GetData(
      {required String url, Map<String, dynamic>? data, String? token}) async {
    dynamic recieveData = await dio?.get(url, queryParameters: data);
    return recieveData;
  }
}
