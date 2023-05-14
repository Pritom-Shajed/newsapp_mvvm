import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/news_article_model.dart';
import 'package:news_app/utils/api_url.dart';

class WebService {


  Future<List<NewsArticle>> fetchHeadlinesByKeyword(String keyword) async{

    Uri url = Uri.parse(ApiURL.headlinesFor(keyword));

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);

      Iterable list  = result['articles'];

      return list.map((article) => NewsArticle.fromJSON(article)).toList();
    } else {
      throw Exception('Failed to get news by keyword');
    }

  }

  Future<List<NewsArticle>> fetchTopHeadlines() async{
    Uri url = Uri.parse(ApiURL.TOP_HEADLINES);
  
    final response = await http.get(url);

    if(response.statusCode == 200){
      final result = jsonDecode(response.body);

      Iterable list = result['articles'];

      return list.map((article) => NewsArticle.fromJSON(article)).toList();
    } else {
      throw Exception('Failed to get top news');
    }

  }
}