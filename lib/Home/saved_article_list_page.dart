


import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_feed/CommonWidgets/news_widget.dart';
import 'package:news_feed/CommonWidgets/progress_indicator.dart';
import 'package:news_feed/utilities/colors.dart';
import 'package:news_feed/utilities/connectionUtils.dart';
import 'package:news_feed/utilities/dialogs.dart';
import 'package:news_feed/utilities/systemConstants.dart';
import 'package:shared_preferences/shared_preferences.dart';


/// the lower widget
/// its the widget with the list view that contains news
class SavedArticleListPage extends StatefulWidget{

  //SavedArticleListPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SavedArticleListPageState();
  }

}


class SavedArticleListPageState extends State<SavedArticleListPage>{



  /// call the new api to get the list of news
  /// initialize an empty list to be fill with news post from the api
  List articles = [];






  /// variable to show that the request has more data
  bool _hasMore =false;

  // the current page number
  int _pageNumber =0;
  // any error of exists
  bool _error = false;

  // indication if the is any server request on process
  bool _loading = true;

  // page threshold
  final int _nextPageThreshold = 5;

  // string to construct url paramaters for the api call
  String request_parameters = "language=en&category";
  @override
  void initState() {
    // TODO: implement initState
   // request_parameters += "=${topic}";
   // getServerResponse(request_parameters, 100,false);

        listFromPreference();
    super.initState();



  }


    listFromPreference() async {
      List saved_articles = [];
      SharedPreferences preferences = await SharedPreferences.getInstance();
     String? articleStrings = preferences.getString("articles");
     if(articleStrings!=null){
    saved_articles= jsonDecode(articleStrings);}

     setState(() {
       articles = saved_articles;
     });
   }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(child:
    Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,

          automaticallyImplyLeading: true,
          title: const Text("Saved"),
        ),
        body: makeListBody()));
  }





  Widget makeListBody() {


    if (articles.isEmpty) {
         return const Center(
            child:Text(
              "No Articles",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16
              ),
            )
         );
    } else {
      return ListView.builder(
        //reverse: true,
          itemCount: articles.length ,
          itemBuilder: (context, index) {



            var article  = articles[index];
            return NewsWidget(article,key: UniqueKey(),);
          });
    }





  }



}