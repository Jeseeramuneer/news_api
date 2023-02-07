import 'package:flutter/material.dart';
import 'package:news_api/model/article_model.dart';

class ArticlePage extends StatelessWidget {
  final Article article;
  const ArticlePage({this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        article.urlToImage != null?
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(article.urlToImage),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(12.0)
                ),
              ),
            )

            :Container(

              height: 200.0,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage("https://media.istockphoto.com/id/1301656823/photo/daily-papers-with-news-on-the-computer.jpg?b=1&s=170667a&w=0&k=20&c=Y0krx8wEAxLd7-ObYRSzLIA8XaSpA7bkuiCYbjR-ZTA="),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(12.0)
              ),
            ),

           //SizedBox(height: 10),
           Container(
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(article.source.name,
                  style: TextStyle(color: Colors.white),),
              ),
            ),
            SizedBox(height: 10),
            Text(article.description,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold
              ),)
          ],
        ),
      ),
    );
  }
}
