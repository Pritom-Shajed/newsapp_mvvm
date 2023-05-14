import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/news_article_model.dart';

class WebService {


  Future<List<NewsArticle>> fetchTopHeadlines() async{
    Uri url = Uri.parse('https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=df077fdbfc1c47cd82fa177fd9d96a4d');
  
    final response = await http.get(url);

    if(response.statusCode == 200){
      final result = jsonDecode(response.body);

      Iterable list = result['articles'];

      print(list.toString());
      return list.map((article) => NewsArticle.fromJSON(article)).toList();
    } else {
      throw Exception('Failed to get news');
    }

  }
}