


import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_feed/utilities/colors.dart';
import 'package:news_feed/utilities/timeFuction.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

// ignore_for_file: prefer_const_constructors
class NewsWidget extends StatefulWidget{
// the article variable
var article;


NewsWidget(this.article, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NewsWidgetState(article);
  }

}

class  NewsWidgetState extends State<NewsWidget> with AutomaticKeepAliveClientMixin{
  var article;

  NewsWidgetState(this.article);
  @override
  void initState() {
    article['bookmarked'] = false;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(15)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
 // check if the article has an image and show the image widget accordingly
            if(article['image_url']!=null)  Container(
                  height:200,

                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: CachedNetworkImage(
                        errorWidget: (s,d,f)=>Image.network(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAX7shRem7wkEmHi4IXE4UanTOK2-3NwLzLQ&usqp=CAU"
                        ),
                        placeholder: (context, url) =>
                            Shimmer.fromColors(
                              child: Container(
                                color: Colors.white,
                              ),
                              baseColor: Colors.black12,
                              highlightColor: Colors.white,
                              loop: 0,
                            ),
                        imageUrl:article['image_url'],
                        fit: BoxFit.cover,
                      ))),
              Expanded(child: Container(

                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                     children: [
                       Row(

                         children: [
                           Expanded(
                             child: Text(article['title'],
                             maxLines: 5,

                             overflow: TextOverflow.ellipsis,
                             style: GoogleFonts.inter(
                                 fontSize: 14,
                                 color: Color.fromRGBO(43, 46, 67, 1),
                                 fontWeight: FontWeight.w800
                             ),),
                           ),
                           InkWell(
                             onTap: () async{
                               setState(() {

                                   article['bookmarked'] =
                                   !article['bookmarked'];
                               } );
                                   SharedPreferences preferences = await SharedPreferences.getInstance();
    List articles = [];
                                   String? articleStrings = preferences.getString("articles");
                                   if(articleStrings !=null){
                                  articles  = jsonDecode(articleStrings);}
                                   if(article['bookmarked']){
                                       if(!articles.contains(article)){
                                          articles.add(article);
                                        // var dd = articles;
                                        //  var json = jsonEncode(dd);
                                          preferences.setString("articles", jsonEncode(articles));


                                       }
                                   }else{
                                      articles.removeWhere((element) => element['title']==article['title']);
                                      preferences.setString("articles", jsonEncode(articles));
                                   }




                             },
                             child: Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Icon(
                                article['bookmarked']? Icons.bookmark:Icons.bookmark_add_outlined,
                                 color: appSecondaryColor,

                               ),
                             ),
                           )
                         ],
                         crossAxisAlignment: CrossAxisAlignment.start,
                       ),
                      if(article['description']!=null) Text(article['description'],
                       maxLines: 6,
                         overflow: TextOverflow.ellipsis,
                       style: GoogleFonts.inter(
                          fontSize: 12

                       ),),


                      SizedBox(height: 20,),

                       Row(
                         crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: article['creator']!=null?  MainAxisAlignment.spaceBetween:MainAxisAlignment.end,
                          children: [
                            if(article['creator']!=null)Expanded(
                              child: Text(article['creator'][0],
                               style: GoogleFonts.inter(
                                  color: Color.fromRGBO(43, 46, 67, 1),
                               ),),
                            ),
                            Text(TimeFunction().getTimeElapsed(article['pubDate'],
                            ),
                            style: GoogleFonts.inter(
                               color: appSecondaryColor,

                            ),)
                          ],
                       )
                     ],
                  ),
                ),
              ))
            ],


          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

}