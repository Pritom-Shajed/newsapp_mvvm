import 'package:flutter/material.dart';
import 'package:news_app/viewmodels/news_article_list_view_model.dart';
import 'package:news_app/widgets/news_list.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  final _controller = TextEditingController();

  @override
  void initState() {
    Provider.of<NewsArticleListViewModel>(context, listen: false).populateNewsByKeyword();
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
      body: Column(
        children: [
          TextField(
            controller: _controller,
            onSubmitted: (value){},
            decoration: InputDecoration(
              labelText: 'Enter search term',
              icon: const Padding(
                padding: EdgeInsets.all(10),
                child: Icon(Icons.search),
              ),
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear), 
              onPressed: (){
                _controller.clear();
              },)
            ),
          ),
          Expanded(child: NewsList(articles: vm.articles))
          
        ],
      )
    );
  }
}