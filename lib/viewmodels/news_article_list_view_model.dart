import 'package:flutter/material.dart';
import 'package:news_app/model/news_article_model.dart';
import 'package:news_app/services/web_service.dart';
import 'package:news_app/viewmodels/news_article_view_model.dart';

class NewsArticleListViewModel extends ChangeNotifier{

  List<NewsArticleViewModel> articles = <NewsArticleViewModel>[];

   Future<void > populateTopHeadlines() async {

    List<NewsArticle> newsArticle = await WebService().fetchTopHeadlines();
  

    articles = newsArticle.map((article) => NewsArticleViewModel(newsArticle: article)).toList();

    notifyListeners();
  }
}