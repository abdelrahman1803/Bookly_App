import 'package:dio/dio.dart';

class HomeApiServices {
  final String _baseUrl = "https://www.googleapis.com/books/v1/";
  final String _endPoint = "volumes?q=programming";
  final Dio dio;

  HomeApiServices({required this.dio});

  Future<Map<String, dynamic>> get({required String url}) async {
    Response response = await dio.get("$_baseUrl$_endPoint");
    return response.data;
  }
}
