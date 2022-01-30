import 'dart:async';
import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_feed/Home/home_page.dart';
import 'package:news_feed/utilities/colors.dart';
import 'package:news_feed/utilities/sizeConfig.dart';

import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';






// ignore_for_file: prefer_const_constructors

Future<void> main() async {
 // WidgetsFlutterBinding.ensureInitialized();
 // await Firebase.initializeApp();
  runApp(TheBase());
}



GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class TheBase extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return //MultiProvider(
       // providers: [


   // ChangeNotifierProvider<CartListModel>(create: (context)=>CartListModel()),
   // ChangeNotifierProvider<OrderListModel>(create: (context)=>OrderListModel()),
   // ChangeNotifierProvider<MdogoBillListModel>(create:(context)=>MdogoBillListModel()),


   // ],

   // child:
    MyApp()
    ;
  }

}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NewsFeed',
      theme: ThemeData(
        // This is the theme of your application.
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.
  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".



  @override
  _MyHomePageState createState() => _MyHomePageState();
}
 //Precache imch;
class _MyHomePageState extends State<MyHomePage> {
  initiateFireAbse() {
    //  PushNotificationsManager manager = PushNotificationsManager();
    // manager.init();
    // manager.firebaseMessaging.configure(
    //   onMessage: (Map<String, dynamic> message) async {
    //     print("onMessage: $message");
    //     //_showItemDialog(message);
    //   },
    // );
  }

  @override
  void initState() {
    // TODO: implement initState
    startTimer();
    initiateFireAbse();
    // imch =
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig(context);
    // Precache(context);

    // Swidth =SizeConfig.screenWidth;
    // Sheight = SizeConfig.screenHeight;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [

          SizedBox(
            height: 10,
          ),
          Center(
            child: GradientText(
              'NEWS FEED',

              style: GoogleFonts.inter(

                  fontSize: 55.0,
                  fontWeight: FontWeight.bold
              ),
              colors: const [
                appPrimaryColor,
                appSecondaryColor,



              ],
            ),

          ),


        ],
      ),

    );
  }

  String token = "";
  bool status = false;

  void startTimer() {
    bool logged = false;


    Timer(Duration(milliseconds: 2000), () async {
      Navigator.push(context, MaterialPageRoute(builder: (mContext) => HomePage()));

    }


    );
  }
}