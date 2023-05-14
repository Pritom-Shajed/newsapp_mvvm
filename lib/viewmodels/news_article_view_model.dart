import 'package:news_app/model/news_article_model.dart';

class NewsArticleViewModel{

  final NewsArticle _newsArticle;

  NewsArticleViewModel({required NewsArticle newsArticle}):_newsArticle = newsArticle;


  String? get title => _newsArticle.title;
  String? get description => _newsArticle.description;
  String? get urlToImage => _newsArticle.urlToImage;
  String? get url => _newsArticle.url;
}