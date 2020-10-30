import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:pozitive/Core/AppConstact/appStyles.dart';

class AppConstant{
  static showFialureDialogue(String message, BuildContext context) async {

    await showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Text(
              "Something went wrong",
              style: AppStyle.headerTextstyle,
            ),
            content: Text(
              message,
              style: AppStyle.smallRedTextStyle,
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
  static String stringValidator(String value, String controllerName) {
    if (value.isEmpty) {
      return "Please enter $controllerName";
    }
    return null;
  }
  static Future checkConnectivity(BuildContext context)async{
    var connectivityResult = await (Connectivity().checkConnectivity());
    if(connectivityResult==ConnectivityResult.none){
      showFialureDialogue('No Internet Connection', context);
    }
//    if (connectivityResult == ConnectivityResult.mobile) {
//      // I am connected to a mobile network.
//    } else if (connectivityResult == ConnectivityResult.wifi) {
//      // I am connected to a wifi network.
//    }
  }
  static showComfirmDialogue({ BuildContext mainContext,Function function}) async {

    await showDialog(
        context: mainContext,
        builder: (ctx) {
          return AlertDialog(
            title: Text(
              "Are you sure, you want to clear all data?",
              style: AppStyle.headerTextstyle,
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("Yes"),
                onPressed: () {
                  function();
                  Navigator.of(mainContext).pop();
                },
              ),
              FlatButton(
                child: Text("No"),
                onPressed: () {
                  Navigator.of(mainContext).pop();
                },
              )
            ],
          );
        });
  }
}