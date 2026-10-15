import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:news_app/test/models/result.dart';

class NewsService {
  static const String key = 'pub_c5fb19851f284beeb49c30939ce1746e';

  final Dio dio = Dio();

  final String baseUrl = 'https://newsdata.io/api/1';

  Future<List<Result>> fetchNews() async {
    try {
      final response = await dio.get(
        "$baseUrl/latest",
        queryParameters: {'apikey': key, 'language': 'en'},
      );

      log('Status code: ${response.statusCode}');
      log('Response data: ${response.data}');

      final data = response.data as Map<String, dynamic>;

      if (data['status'] != 'success') {
        throw Exception(
          'News API error: ${data['results'] ?? data['message'] ?? data}',
        );
      }

      final List<dynamic> articles = response.data['results'];
      print(articles);
      return articles
          .map((article) => Result.fromJson(article as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      log('Dio error: ${e.message}');
      log('HTTP status: ${e.response?.statusCode}');
      log('API response: ${e.response?.data}');
      rethrow;
    } catch (e, stackTrace) {
      log('Unexpected error: $e', stackTrace: stackTrace);
      rethrow;
    }
  }
}
