import 'package:flutter/material.dart';
import 'package:news_api/pages/article_pg.dart';
import 'package:news_api/services/api_service.dart';

import '../model/article_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService client=ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("News Api"),
      ),
      body: FutureBuilder<List<Article>>(
        future:  client.getArticle(),
        builder: (BuildContext context,AsyncSnapshot<List<Article>> snapshot){
          if(snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  var articles=snapshot.data[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => ArticlePage(article: articles,)));
                    },
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          snapshot.data[index].urlToImage != null?
                          Container(
                            height: 100,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(snapshot.data[index].urlToImage.toString()),
                                  fit: BoxFit.cover),

                            ),
                          )

                         : Container(
                            height: 100,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://media.istockphoto.com/id/1301656823/photo/daily-papers-with-news-on-the-computer.jpg?b=1&s=170667a&w=0&k=20&c=Y0krx8wEAxLd7-ObYRSzLIA8XaSpA7bkuiCYbjR-ZTA="),
                                  fit: BoxFit.cover),

                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(articles.source.name,
                                style: TextStyle(color: Colors.white),),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(snapshot.data[index].title.toString(),
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                            ),)
                        ],
                      ),
                    ),
                  );
                }
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
          },

        ),
      );

  }
}
