import 'package:dio/dio.dart';

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



  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? queryParameters,
    ProgressCallback? onReceiveProgress,
    String? token,
  }) async {

    try {
      dio!.options.headers = {
        'Authorization': 'Bearer ${token ?? ''}',
      };
      final Response response = await dio!.get(
        url,
        queryParameters: queryParameters,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

}
