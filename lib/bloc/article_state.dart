part of 'article_bloc.dart';

sealed class ArticleState extends Equatable {
  const ArticleState();

  @override
  List<Object> get props => [];
}

final class ArticleInitial extends ArticleState {
  const ArticleInitial();

  @override
  List<Object> get props => [];
}

final class ArticlesLoaded extends ArticleState {
  final List<Article> articles;

  const ArticlesLoaded(this.articles);

  @override
  List<Object> get props => [articles];
}

final class ArticlesError extends ArticleState {
  final String errorMessage;

  const ArticlesError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
