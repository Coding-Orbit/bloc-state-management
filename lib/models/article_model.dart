import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final String author;
  final String title;
  final String description;
  final String url;
  final String imageUrl;
  final String publishedAt;
  final String content;
  final ArticleSource source;

  const Article({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.imageUrl,
    required this.publishedAt,
    required this.content,
    required this.source,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        author: json['author'],
        title: json['title'],
        description: json['description'],
        url: json['url'],
        imageUrl: json['urlToImage'],
        publishedAt: json['publishedAt'],
        content: json['content'],
        source: ArticleSource.fromJson(json['source']),
      );

  @override
  List<Object?> get props => [
        author,
        title,
        description,
        url,
        imageUrl,
        publishedAt,
        content,
        source,
      ];
}

class ArticleSource extends Equatable {
  final String? id;
  final String name;

  const ArticleSource({required this.id, required this.name});

  factory ArticleSource.fromJson(Map<String, dynamic> json) => ArticleSource(
        id: json['id'],
        name: json['name'],
      );

  @override
  List<Object?> get props => [id, name];
}
