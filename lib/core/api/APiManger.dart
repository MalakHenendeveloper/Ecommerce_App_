import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/api/Endpoints.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
@singleton
class Apimanger {
  late Dio dio;
  Apimanger() {
    dio = Dio();
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true));
  }
  Future<Response> getDate(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) {
    return dio.get(Endpoints.Url + endpoint,

        options: Options(
          headers: headers,
          validateStatus: (status) => true,
        ));
  }

  Future<Response> PostDate(
    String endpoint, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
  }) {
    return dio.post(Endpoints.Url + endpoint,
data: body,
        options: Options(
          headers: headers,
          validateStatus: (status) => true,
        ));
  }
  Future<Response> Deletedata(String endpoint,{
    Map<String, dynamic>? headers,
    Map<String, dynamic>? body,
  } ){
  return  dio.delete(Endpoints.Url+endpoint,
  data: body,
    options: Options(validateStatus:(status)=>true, headers: headers)
  );
  }
  Future<Response> UpdateData(
      String endpoints,{
        Map<String, dynamic>? headers,
        Map<String, dynamic>? body,
  }
      ){
 return   dio.put(Endpoints.Url+endpoints,
    data: body,
      options: Options(validateStatus: (status)=>true, headers: headers)
    );
  }
}
