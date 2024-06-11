import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo_app/screens/article_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text(
          'Home Screen',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple.shade800,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width - 50,
              height: 70,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) =>
                          const ArticleScreen(hasError: false)),
                ),
                child: const Text(
                  'Normal Flow',
                  style: TextStyle(fontSize: 22),
                ),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: MediaQuery.of(context).size.width - 50,
              height: 70,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) =>
                          const ArticleScreen(hasError: true)),
                ),
                child: const Text(
                  'Error Flow',
                  style: TextStyle(fontSize: 22),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
