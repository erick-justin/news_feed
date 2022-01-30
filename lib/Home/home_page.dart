


// main page to show new feeds loaded from newdata api

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_feed/CommonWidgets/categorty_widget.dart';
import 'package:news_feed/Home/news_list_widget.dart';
import 'package:news_feed/Home/saved_article_list_page.dart';
import 'package:news_feed/Home/upper_slider_widget.dart';
import 'package:news_feed/utilities/commonFunction.dart';
import 'package:news_feed/utilities/sizeConfig.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   return HomePageState();
  }

}


class HomePageState extends State<HomePage>{



  bool hasDoneLoading = false;


  //SharedPreferences pref;

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  ScrollController navController = ScrollController();
  @override
   Widget build(BuildContext context) {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.white
        ),
      );
      // TODO: implement build
      return SafeArea(
        child: Scaffold(
          key: _key,
          drawer: drawer(),


            appBar:  AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              title: const Text("News",style: TextStyle(
                 color: Colors.black
              ),),
              leading: InkWell(
                onTap: (){
                  _key.currentState!.openDrawer();
                },
                  child: const Icon(Icons.menu)),

              iconTheme: const IconThemeData(
                  color: Colors.black
              ),
              actions: <Widget>[
                // action button


                Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        // Navigator.pop(context);
                       // Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingPage(user)));
                        showModalBottomSheetF(context,Container(
                          height: 600,
                            child:Column(

                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Choose Topic",
                                  style: GoogleFonts.inter(
                                     color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w800
                                  ),),
                                ),
                                Expanded(child: CategoriesWidget()),
                              ],
                            )),color: Colors.white);

                      },
                    ), ),





                // action button

                // overflow menu
              ],

            ),
            body:


            RefreshIndicator(
              onRefresh: ()async {
               // getServerResponse(, 100, false);
              },
              child: DefaultTabController(
                length: 1,
                child: NestedScrollView(
                  controller: navController,
                  headerSliverBuilder: (context, value) {
                    return [
                      SliverAppBar(
                        floating: true,
                        automaticallyImplyLeading: false,
                        pinned: true,
                        backgroundColor: Colors.white,


                         // bottom: const TabBar(
                         //     tabs: [
                         //        Tab(
                         //            child:Text("NEWS"))
                         // ]),
                        //
                        //   tabs: [
                        //     Tab(
                        //         child: SvgPicture.asset("flycons/grid.svg",
                        //           color: Colors.black,)
                        //     ),
                        //     Tab(
                        //         child: Container(
                        //           height: 30,
                        //           child: Image.asset("flycons/pdf.png",
                        //             color: Colors.black,),
                        //         )
                        //     ),
                        //     Tab(
                        //         child: Container(
                        //           height: 30,
                        //           child: Image.asset("flycons/qn.png",
                        //             color: Colors.black,),
                        //         )
                        //     ),
                        //   ],
                        // ),
                        expandedHeight: SizeConfig.screenHeight!*0.5,
                        flexibleSpace: FlexibleSpaceBar(
                          collapseMode: CollapseMode.pin,
                          background:   RefreshIndicator(
                            onRefresh: ()async{
                            //  getServerResponse(getUserDetailsJson(), 100, false);
                            },
                            child: NewsSliderWidget()
                            ),
                          ), // This is where you build the profile part
                        ),

                    ];
                  },
                  body: const TabBarView(
                    children: [
                      // Container(),
                      // Container(),


                      NewsListWidget()
                    ],
                  ),
                ),
              ),
            )
      ));
    }




  // Future<void> getServerResponse (String requestString,int rCode, bool hasLoading) async {
  //  // requestString = requestString+"&page=$_pageNumber";
  //   if (hasLoading){
  //     // if this is true show the overall loading indicator
  //     MessageDialogs().loadingIndicator(context);}
  //
  //   // await fot the server response from the server
  //   // send the request to the  connection util class
  //   // and it will return the response from the server
  //   String serverResponse = await  ConnectionUtils(context).createPost(requestString, hasLoading);
  //   if (hasLoading){
  //     MessageDialogs().dismissDialogs(context);}
  //   if (kDebugMode) {
  //     print(serverResponse);
  //   }
  //   if (serverResponse != null) {
  //     var responseBody = jsonDecode(serverResponse);
  //     int code = responseBody['code'];
  //     if (code == 200) {
  //       if(rCode == 100) {
  //         // Navigator.push(context,
  //         // MaterialPageRoute(builder: (mContext) => HomeDisplayPage()));
  //         setState(() {
  //
  //         });
  //
  //       }
  //
  //       if( rCode == 200){
  //         MessageDialogs().messageDialog(context, "Success", responseBody['msg'], 432);
  //       }
  //
  //
  //
  //     }
  //     else if (code == 301) {
  //
  //       MessageDialogs().messageDialog(
  //           context, "Success", responseBody['msg'],4322);
  //
  //
  //
  //     }
  //     else {
  //       MessageDialogs().messageDialog(
  //           context, "Error!", responseBody['msg'], 54);
  //     }
  //   }
  //
  //
  // }

  Widget drawer(){
    return Container(
      color: Colors.white,
      width: SizeConfig.screenWidth!*0.6,

      child:
      Column(
        children: [

          SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child:
                  Container(

                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.black
                      ),

                      child: const Padding(
                        padding: EdgeInsets.all(16),
                        child: Icon(Icons.person,size: 70,color:Colors.white,),

                      )   ),

                ),
                const Text(
                  "News Feed",
                  style: TextStyle(
                    color:Colors.black,
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,



             children: [
              InkWell(
                onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (builder)=>SavedArticleListPage()));
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(child: Text("Saved")),
                ),
              )


]




            ),
          ),

          // Spacer(),
          // ListTile(
          //   onTap: () {
          //
          //     launch("https://www.notion.so/Swahilies-Terms-And-Conditions-Muongozo-Na-Masherti-Ya-Swahilies-9e49e867add44d5e8ff803fa3ff66014");
          //
          //   },
          //   leading: Icon(
          //     EvaIcons.list,
          //     color: appDeemBlackColor,
          //     size: 20,
          //   ),
          //   title: Text('Terms and Conditions',
          //       style: TextStyle(fontSize: 14, color:  appDeemBlackColor)),
          // ),
          // ListTile(
          //   onTap: () {
          //     launch("tel:+255682411725");
          //   },
          //   leading: Icon(
          //     EvaIcons.phoneCallOutline,
          //     color: appDeemBlackColor,
          //     size: 20,
          //   ),
          //   title: Text('Contact',
          //       style: TextStyle(fontSize: 14, color:  appDeemBlackColor)),
          // ),
          // ListTile(
          //   onTap: () {
          //     startTimer();
          //   },
          //   leading: Icon(
          //     Icons.arrow_upward,
          //     color:  appDeemBlackColor,
          //     size: 20,
          //   ),
          //   title: Text('Logout',
          //       style: TextStyle(fontSize: 14, color:  appDeemBlackColor)),
          // ),
        ],
      ),

    );
  }
}