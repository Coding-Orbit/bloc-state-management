import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo_app/bloc/article_bloc.dart';
import 'package:flutter_bloc_demo_app/widgets/article_widget.dart';
import 'package:flutter_bloc_demo_app/widgets/custom_error_widget.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key, required this.hasError});

  final bool hasError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Articles Screen',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple.shade800,
      ),
      backgroundColor: Colors.grey.shade200,
      body: BlocProvider(
          create: (context) =>
              ArticleBloc()..add(FetchArticles(hasError: hasError)),
          child:
              BlocBuilder<ArticleBloc, ArticleState>(builder: (context, state) {
            if (state is ArticleInitial) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is ArticlesError) {
              return CustomErrorWidget(errorMessage: state.errorMessage);
            }

            if (state is! ArticlesLoaded) {
              return const SizedBox();
            }

            return ListView.builder(
              itemCount: state.articles.length,
              itemBuilder: (context, index) => ArticleWidget(
                article: state.articles[index],
              ),
            );
          })),
    );
  }
}
