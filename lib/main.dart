import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_new/Profile.dart';
import 'registration.dart';
import 'mainpage.dart';
import 'login.dart';
import 'SplashScreen.dart';

var routes = <String, WidgetBuilder>{
  "/login": (BuildContext context) => Login(),
  "/mainpage": (BuildContext context) => HomeScreen(),
  "/register": (BuildContext context) => RegisterPage(),
  "/profile": (BuildContext context) => ProfilePage(),
};

void main() {
  var app = MyApp();
  runApp(app);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.grey),
      home: SplashScreen(),
      routes: routes,
    );
  }
}
