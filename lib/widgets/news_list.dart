import 'package:flutter/material.dart';
import 'package:news_app/viewmodels/news_article_view_model.dart';

class NewsList extends StatelessWidget {

  final List<NewsArticleViewModel> articles;

  const NewsList({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        
        itemCount: articles.length,
        separatorBuilder: (context, index) => const SizedBox(height: 20,), 
        itemBuilder: ((context, index) {
          var article = articles[index];
          return ListTile(
            leading: Container(
              height: 100,
              width: 100,
              child: article.urlToImage != null ? Image.network(article.urlToImage!): Image.asset('images/news.png'),
            ),
            title: Text(article.title!),
            //subtitle: article.urlToImage != null ? Text(article.description!): const Text('Failed to load data'),
          );
        }),);
  }
}