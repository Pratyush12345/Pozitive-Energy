import 'package:flutter/material.dart';
import 'package:pozitive/Pages/homepage.dart';
import 'package:pozitive/Pages/loginpage.dart';
import 'package:provider/provider.dart';
import 'package:pozitive/Core/Model/user.dart';

class LaunchScreen extends StatefulWidget {
  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    // to check user Login or not

    if (user != null) {
      if (user.accountId != null) {
        return HomePage();
      } else {
        return LogInPage();
      }
      // if user Login it goes to home screen
    } else {
      // if user not Login it goes to LogIn screen
      return LogInPage();
    }
  }
}
