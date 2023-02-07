import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_api/model/article_model.dart';


class ApiService{
  Future<List<Article>> getArticle() async{
    final url="https://newsapi.org/v2/top-headlines?country=us&category=technology&apiKey=4d1d2cc18b834bd5b82fd691931bcf8e";
    var response= await http.get(Uri.parse(url));
    if(response.statusCode==200){
      var body=json.decode(response.body);
      List<Article>_data=List<Article>.from(body["articles"].map((e) =>Article.fromJson(e)).toList());
      return _data;
    }
    else{
      List<Article> _data=[];
      return _data;
    }

  }
}