import 'dart:convert';
import 'package:http/http.dart' as http;
import '../core/models/news_model.dart';

class NewsRepository {
  static const String _apiKey = '7d77ac6b67084dbaa790937d90b5edda';
  static const String _baseUrl = 'https://newsapi.org/v2/top-headlines';

  Future<List<NewsArticle>> fetchNews() async {
    final String url = '$_baseUrl?country=us&apiKey=$_apiKey';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final articles = data['articles'] as List;

        return articles.map((json) => NewsArticle.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch news');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
