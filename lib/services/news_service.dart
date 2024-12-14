import 'dart:convert';
import 'package:http/http.dart' as http;
import '../core/models/news_model.dart';

class NewsService {
  static const String _baseUrl = 'https://newsapi.org/v2/top-headlines';
  static const String _apiKey = '7d77ac6b67084dbaa790937d90b5edda';

  Future<List<NewsArticle>> fetchNews() async {
    try {
      final response = await http.get(
        Uri.parse("$_baseUrl?country=us&apiKey=$_apiKey"),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        List articles = data['articles'];

        return articles.map((e) => NewsArticle.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load news');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
