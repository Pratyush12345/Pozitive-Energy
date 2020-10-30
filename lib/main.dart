
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Core/Services/AuthService.dart';
import 'package:pozitive/Core/getIt.dart';
import 'package:pozitive/routes.dart';
import 'package:pozitive/Pages/lancherPage.dart';
import 'package:provider/provider.dart';

import 'Pages/loginpage.dart';
//List<CameraDescription> cameras;
//void main() => runApp(MyApp());
Future<void> main() async {
  setupGetIt();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Color.fromRGBO(18, 122, 69, 1),//Colors.blue // navigation bar color
    statusBarColor: Color.fromRGBO(18, 122, 69, 1), // status bar color
  ));
//  cameras = await availableCameras();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(providers: [
      StreamProvider<User>.value(value: AutService().user)
    ],
      child: MaterialApp(
        title: 'Pozitive',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.

          fontFamily: "Roboto",
          primarySwatch:MaterialColor(
              Color.fromRGBO(18, 122, 69, 1).value,
              {
                50: Color.fromRGBO(18, 122, 69, 1),
                100: Color.fromRGBO(18, 122, 69, 1),
                200: Color.fromRGBO(18, 122, 69, 1),
                300: Color.fromRGBO(18, 122, 69, 1),
                400: Color.fromRGBO(18, 122, 69, 1),
                500: Color.fromRGBO(18, 122, 69, 1),
                600: Color.fromRGBO(18, 122, 69, 1),
                700: Color.fromRGBO(18, 122, 69, 1),
                800: Color.fromRGBO(18, 122, 69, 1),
                900: Color.fromRGBO(18, 122, 69, 1)
              }
          ),

          scaffoldBackgroundColor: Color.fromRGBO(228, 241, 215, 1),


        ),
        onGenerateRoute: Router.generateRoute,
        home:LaunchScreen(),
      ),
    );
  }
}
