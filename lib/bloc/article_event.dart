part of 'article_bloc.dart';

sealed class ArticleEvent extends Equatable {
  const ArticleEvent();

  @override
  List<Object> get props => [];
}

class FetchArticles extends ArticleEvent {
  final bool hasError;
  const FetchArticles({this.hasError = false});

  @override
  List<Object> get props => [hasError];
}
