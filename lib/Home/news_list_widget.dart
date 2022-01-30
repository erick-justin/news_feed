


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


/// the lower widget
/// its the widget with the list view that contains news
class NewsListWidget extends StatefulWidget{
   const NewsListWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   return NewsListWidgetState();
  }

}


class NewsListWidgetState extends State<NewsListWidget>{



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
  String request_parameters = "language=en";
   @override
  void initState() {
    // TODO: implement initState

     getServerResponse(request_parameters, 100,false);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return makeListBody();
  }


   Future<void> getServerResponse (String requestString,int rCode, bool hasLoading) async {
     requestString = requestString+"&page=$_pageNumber";
     if (hasLoading){
       // if this is true show the overall loading indicator
       MessageDialogs().loadingIndicator(context);}

     // await fot the server response from the server
     // send the request to the  connection util class
     // and it will return the response from the server
     String serverResponse = await  ConnectionUtils(context).createPost(requestString, hasLoading);
     if (hasLoading){
       MessageDialogs().dismissDialogs(context);}
     if (kDebugMode) {
       print(serverResponse);
     }
     if (serverResponse != null) {
       var responseBody = jsonDecode(serverResponse);
       String status = responseBody['status'];
       if (status =="success") {
         if(rCode == 100) {
           // Navigator.push(context,
           // MaterialPageRoute(builder: (mContext) => HomeDisplayPage()));
           setState(() {
             articles = responseBody['results'];
             hasLoading = false;

           });

         }




       }

       else {

         setState(() {
           _error = true;
         });
         MessageDialogs().messageDialog(
             context, "Error!", responseBody['results']['message'], 54);
       }
     }


   }


  Widget makeListBody() {


    if (articles.isEmpty) {
      if (_loading) {
        return  Center(
            child: Padding(
                padding: const EdgeInsets.all(8),
                child: NewsFeedLoadingIndicator()
            ));
      } else if (_error) {
        return Center(
            child: InkWell(
              onTap: () {
                setState(() {
                  _loading = true;
                  _error = false;
                //  getServerResponse(request_parameters,100, false);
                });
              },
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Text("Error while loading photos, tap to try again"),
              ),
            ));
      }
    } else {
      return ListView.builder(
        //reverse: true,
          itemCount: articles.length + (_hasMore ? 1 : 0),
          itemBuilder: (context, index) {
            if (index ==articles.length - _nextPageThreshold) {
            //  getServerResponse(request_parameters,100, false);
            }
            if (index == articles.length) {
              if (_error) {
                return Center(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _loading = true;
                          _error = false;
                         // getServerResponse(request_parameters,100, false);
                        });
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(16),
                        child: Text("Error while loading photos, tap to try agin"),
                      ),
                    ));
              } else {
                return Center(
                    child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: NewsFeedLoadingIndicator()
                    ));
              }
            }
            var article  = articles[index];
            return NewsWidget(article,key: UniqueKey(),);
          });
    }
    return Container();




}



}