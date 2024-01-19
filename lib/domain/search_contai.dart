import 'dart:convert';
import 'package:dio/dio.dart';

Future<Map<String, dynamic>> fetchData(String name) async {
  Dio dio = Dio();
  try {
    final response = await dio.get('url');

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.data);
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  } catch (e) {
    throw Exception('Failed to load data: $e');
  }
}
