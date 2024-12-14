class NewsArticle {
  final String? title;
  final String? sourceName;
  final String? imageUrl;
  final String? publishedAt;

  NewsArticle({
    this.title,
    this.sourceName,
    this.imageUrl,
    this.publishedAt,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      title: json['title'] as String?,
      sourceName: json['source']?['name'] as String?,
      imageUrl: json['urlToImage'] as String?,
      publishedAt: json['publishedAt'] as String?,
    );
  }
}
