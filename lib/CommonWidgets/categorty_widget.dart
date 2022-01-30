


import 'dart:math';

import 'package:bubble_chart/bubble_chart.dart';
import 'package:flutter/material.dart';
import 'package:news_feed/Home/topic_article_list_%5Bage.dart';

class CategoriesWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: BubbleChartLayout(
        padding: 10,
        children: [










          BubbleNode.leaf(
            value: 10,
            options: BubbleOptions(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>TopicArticlesListPage("technology")));
              },
              child: const Text("Tech",style: TextStyle(
                  fontWeight: FontWeight.bold
              ),),
              color: () {
                Random random = Random();
                return Colors.primaries[random.nextInt(Colors.primaries.length)];
              }(),
            ),),
          BubbleNode.leaf(
            value: 8,
            options: BubbleOptions(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>TopicArticlesListPage("science")));
              },
              child: const Text("Science",style: TextStyle(
                 fontWeight: FontWeight.bold
              ),),
              color: () {

                Random random = Random();
                return Colors.primaries[random.nextInt(Colors.primaries.length)];
              }(),
            ),),
          BubbleNode.leaf(
            value: 6,
            options: BubbleOptions(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>TopicArticlesListPage("food")));
              },
              child: const Text("Food",style: TextStyle(
                  fontWeight: FontWeight.bold
              ),),
              color: () {
                Random random = Random();
                return Colors.primaries[random.nextInt(Colors.primaries.length)];
              }(),
            ),),
          BubbleNode.leaf(
            value: 9,
            options: BubbleOptions(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>TopicArticlesListPage("politics")));
              },
              child: const Text("Politics",style: TextStyle(
                  fontWeight: FontWeight.bold
              ),),
              color: () {
                Random random = Random();
                return Colors.primaries[random.nextInt(Colors.primaries.length)];
              }(),
            ),),
          BubbleNode.leaf(
            value: 9,
            options: BubbleOptions(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>TopicArticlesListPage("sports")));
              },
              child: const Text("Sports",style: TextStyle(
                  fontWeight: FontWeight.bold
              ),),
              color: () {
                Random random = Random();
                return Colors.primaries[random.nextInt(Colors.primaries.length)];
              }(),
            ),),
          BubbleNode.leaf(

            value: 7,

            options: BubbleOptions(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>TopicArticlesListPage("business")));
              },
              child: const Text("Business"),

              color: () {
                Random random = Random();
                return Colors.primaries[random.nextInt(Colors.primaries.length)];
              }(),
            ),),
        ],
        duration: const Duration(milliseconds: 500),
      ),
    );
  }
  
}