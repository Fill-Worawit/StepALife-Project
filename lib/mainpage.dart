import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  int hexColor(String colorCode) {
    String colorstr = '0xff' + colorCode;
    int colorint = int.parse(colorstr);
    return colorint;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(hexColor('E5E5E5')),
      body: ListView(
        children: [
          SingleChildScrollView(
            child: Column(children: [
              Container(
                height: 150,
                color: Color(hexColor('EFECE5')),
                constraints: BoxConstraints.tightForFinite(
                  width: 500,
                ),
                child: Image(
                  image: AssetImage('assets/image/icon.jfif'),
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
