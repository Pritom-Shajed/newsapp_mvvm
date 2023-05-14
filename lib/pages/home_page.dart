import 'package:flutter/material.dart';
import 'package:news_app/viewmodels/news_article_list_view_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    Provider.of<NewsArticleListViewModel>(context, listen: false).populateTopHeadlines();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    final vm = Provider.of<NewsArticleListViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('News App'),
        centerTitle: true,
      ),
      body: ListView.separated(
        
        itemCount: vm.articles.length,
        separatorBuilder: (context, index) => const SizedBox(height: 20,), 
        itemBuilder: ((context, index) {
          var article = vm.articles[index];
          return ListTile(
            leading: Container(
              height: 100,
              width: 100,
              child: article.urlToImage != null ? Image.network(article.urlToImage!): Image.asset('images/news.png'),
            ),
            title: Text(article.title!),
            subtitle: article.urlToImage != null ? Text(article.description!): const Text('Failed to load data'),
          );
        }),)
    );
  }
}