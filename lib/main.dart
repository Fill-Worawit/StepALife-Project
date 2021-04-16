import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'registration.dart';
import 'mainpage.dart';
import 'login.dart';
import 'SplashScreen.dart';

var routes = <String, WidgetBuilder>{
  "/login": (BuildContext context) => Login(),
  "/mainpage": (BuildContext context) => MainPage(),
  "/register": (BuildContext context) => RegisterPage(),
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
