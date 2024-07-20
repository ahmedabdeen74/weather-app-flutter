import 'package:dio/dio.dart';
class ApiService {
  final Dio dio;
  final String baseUrl='http://api.weatherapi.com/v1';
  ApiService(this.dio);
  Future<Map<String,dynamic>> get({required String endPoint}) async {
    Response response = await dio.get('$baseUrl$endPoint');
    return response.data;
  }
}