import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_demo_app/models/article_model.dart';
import 'package:flutter/services.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  ArticleBloc() : super(const ArticleInitial()) {
    on<FetchArticles>(_fetchArticles);
  }

  FutureOr<void> _fetchArticles(
    FetchArticles event,
    Emitter<ArticleState> emit,
  ) async {
    emit(const ArticleInitial());

    await Future.delayed(const Duration(seconds: 1));

    if (event.hasError) {
      // simulate error
      emit(const ArticlesError("Something went wrong while fetching article!"));
      return;
    }

    final String jsonString =
        await rootBundle.loadString('assets/sample_data.json');
    final Map<String, dynamic> json = jsonDecode(jsonString);

    final articles =
        (json['articles'] as List).map((e) => Article.fromJson(e)).toList();
    emit(ArticlesLoaded(articles));
  }
}
