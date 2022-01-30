


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_feed/utilities/colors.dart';

class NewsFeedLoadingIndicator extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      return const Center(
        child: CircularProgressIndicator(
           color: appSecondaryColor,
          strokeWidth: 1,
        ),
      );
  }

}