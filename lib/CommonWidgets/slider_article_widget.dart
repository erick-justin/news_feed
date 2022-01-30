


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_feed/utilities/colors.dart';
import 'package:news_feed/utilities/sizeConfig.dart';
import 'package:news_feed/utilities/timeFuction.dart';

class SliderArticlewidget extends StatefulWidget{
  var article;


  SliderArticlewidget(this.article, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SliderArticleWidgetState(article);
  }



}


class SliderArticleWidgetState extends State<SliderArticlewidget>{
  var article;

  SliderArticleWidgetState(this.article);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: double.infinity,
        decoration:  BoxDecoration(
         // borderRadius: const BorderRadius.all( Radius.circular(25)),
          color: appSecondaryColor,
          image: DecorationImage(

              fit: BoxFit.cover,
              colorFilter:  ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken),
              image:  NetworkImage(article['image_url'])
          ),),
      child:
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            SizedBox(
               height: SizeConfig.screenHeight!*0.15,
            ),
            Text(article['title'],
              maxLines: 5,

              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.inter(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.w800
              ),),
            if(article['description']!=null)Text(article['description'],
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.inter(
                  fontSize: 12,
                color: Colors.white

              ),),


             SizedBox(height: 20,),

            Row(
              mainAxisAlignment: article['creator']!=null?  MainAxisAlignment.spaceBetween:MainAxisAlignment.end,
              children: [
                if(article['creator']!=null)Expanded(
                  child: Text(article['creator'][0],
                    style: GoogleFonts.inter(

                      color: Colors.white,
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

    );
  }

}