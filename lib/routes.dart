import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pozitive/Pages/homepage.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name){

      case HomePage.routeName:
        return PageTransition(
          child: HomePage(),
          type: PageTransitionType.rightToLeft,
          settings: settings,

        );
        break;


    }
    return null;
  }
}