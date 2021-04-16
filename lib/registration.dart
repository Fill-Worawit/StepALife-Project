import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {

  int hexColor(String colorCode) {
    String colorstr = '0xff' + colorCode;
    int colorint = int.parse(colorstr);
    return colorint;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      Container(
        height: 20,
        constraints: BoxConstraints.tightForFinite(
          width: 500,
        ),
      ),
      Text(
        'Username',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      Container(
        margin: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            fillColor: Color(hexColor('FFD8D8')),
            filled: true,
          ),
        ),
      ),
      Text(
        'Password',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      Container(
        margin: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(width: 1),
            ),
            fillColor: Color(hexColor('FFD8D8')),
            filled: true,
          ),
          obscureText: true,
        ),
      ),
        ],
      )
    )]));
  }
}