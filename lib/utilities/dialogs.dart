import 'package:flutter/material.dart';


import 'colors.dart';

import 'systemConstants.dart';

class MessageDialogs {
// a dialog to show messages
  Future<void> messageDialog(BuildContext mContext, String header, String message, int code) async {
    return showDialog<void>(
      context: mContext,

      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: appPrimaryColor,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25.0))),
          title: Text(
            header,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          content: SingleChildScrollView(
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: const Text(
                 "OK",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                if (code == loginCode) {
                  //  Navigator.push(mContext,
                  // MaterialPageRoute(builder: (mContext) => LoginPageNew()));
                }
                if (code == 1) {
                  // Navigator.push(mContext,   MaterialPageRoute(builder: (mContext) => HomeDisplayPage(index:1)));

                }

                if (code == 2) {
                  // Navigator.push(mContext,   MaterialPageRoute(builder: (mContext) => HomeDisplayPage(index:2)));

                }

                if (code == homeCode) {
                //  Navigator.push(mContext, MaterialPageRoute(builder: (mContext) => HomePage()));
                }



                if (code == backCode) {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> loginDialog(BuildContext mContext, String header, String message, int code) async {
    return showDialog<void>(
      context: mContext,

      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: appPrimaryColor,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25.0))),
          title: Text(
            header,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          content: SingleChildScrollView(
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: const Text(
                "OK",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: const Text(
                "REGISTER",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();

                //   Navigator.push(mContext,
                //   MaterialPageRoute(builder: (mContext) => LoginPageNew()));
              },
            ),
          ],
        );
      },
    );
  }

  // loading dialog to indication a loading process
  var smeContext;
  Future<void> loadingIndicator(BuildContext mContext) async {
    return showDialog<void>(
      context: mContext,

      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: appBlackColorWithOpacity,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25.0))),
          content: const SingleChildScrollView(
            child: SizedBox(
              height: 100,
              width: 300,
              child: Center(
                child: SizedBox(
                  width: 70,
                  height: 70,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    semanticsLabel: "Login",
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          actions: const <Widget>[],
        );
      },
    );
  }

  void dismissDialogs(BuildContext c) {
    Navigator.of(c).pop();
  }
}
