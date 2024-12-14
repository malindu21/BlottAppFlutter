import 'package:flutter/material.dart';
import '../core/models/news_model.dart';
import '../repository/news_repository.dart';

class DashboardViewModel extends ChangeNotifier {
  final NewsRepository _repository = NewsRepository();

  List<NewsArticle> _news = [];
  List<NewsArticle> get news => _news;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  // Fetch news and notify listeners
  Future<void> fetchNews() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _news = await _repository.fetchNews();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
