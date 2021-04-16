import 'package:flutter/material.dart';
import 'dart:async'; //for timer

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), () => Navigator.pushNamed(context, "/login"));
  }

  int hexColor(String colorCode) {
    String colorstr = '0xff' + colorCode;
    int colorint = int.parse(colorstr);
    return colorint;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(fit: StackFit.expand, children: <Widget>[
      Container(
        color: Color(hexColor('F6EBE0')),
      ),
      Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        Expanded(
          flex: 2,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10, color: Colors.grey, spreadRadius: 5)
                    ],
                  ),
                  child: CircleAvatar(
                      backgroundColor: Color(hexColor('EFECE5')),
                      radius: 150.5,
                      child: Image(
                        image: AssetImage('assets/image/icon.jfif'),
                        fit: BoxFit.cover,
                      )),
                ),
              ],
            ),
          ),
        ),
      ])
    ]));
  }
}
