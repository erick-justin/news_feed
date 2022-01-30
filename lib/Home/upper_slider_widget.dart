




import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_feed/CommonWidgets/progress_indicator.dart';
import 'package:news_feed/CommonWidgets/slider_article_widget.dart';
import 'package:news_feed/utilities/connectionUtils.dart';
import 'package:news_feed/utilities/dialogs.dart';
import 'package:news_feed/utilities/sizeConfig.dart';

class NewsSliderWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NewsSliderWigetState();
  }

}

class NewsSliderWigetState extends State<NewsSliderWidget>{


  /// call the new api to get the list of news
  /// initialize an empty list to be fill with news post from the api
  List articles = [];


  // indication if the is any server request on process
  bool _loading = true;



// string to construct url paramaters for the api call
  String request_parameters = "language=en&category=top";
  @override
  void initState() {
    // TODO: implement initState

    getServerResponse(request_parameters, 100,false);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return !_loading? Container(
     height: double.infinity,
     child: CarouselSlider(

       options: CarouselOptions(

           viewportFraction: 1,
           height: SizeConfig.screenHeight!*0.5,

           autoPlay: true,
           enableInfiniteScroll: true,


           autoPlayInterval: const Duration(milliseconds: 5000),


           //height:height,

           // onPageChanged: (index,reason ){
           //   setState(() {
           //     picIndex = index;
           //     track = makeIndicator(index+1, mediaFiles.length);
           //   });
           //
           // }


       ),
       items: articles.map((i)  {
         //  sizeSize(_calculateImageDimension(i.media_url));


         return SliderArticlewidget(i) ;
       }).toList(),
     ),
   ):NewsFeedLoadingIndicator();
  }



  Future<void> getServerResponse (String requestString,int rCode, bool hasLoading) async {
   
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
            _loading = false;
            articles = responseBody['results'];
            
            articles  =articles.where((element) => element['image_url']!=null).toList(growable: true);
            hasLoading = false;

          });

        }




      }

      else {

      
        MessageDialogs().messageDialog(
            context, "Error!", responseBody['results']['message'], 54);
      }
    }


  }


}