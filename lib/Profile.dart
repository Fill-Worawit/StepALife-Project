import 'dart:ui';

import 'package:flutter/material.dart';
import 'user.dart';
import 'mainpage.dart';

class ProfilePage extends StatelessWidget {
  int hexColor(String colorCode) {
    String colorstr = '0xff' + colorCode;
    int colorint = int.parse(colorstr);
    return colorint;
  }

  final List<user> currentUsers;

  ProfilePage({Key key, this.currentUsers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(hexColor("F6EBE0")),
        body: ListView(children: [
          SingleChildScrollView(
              child: Column(children: [
            //Header
            Container(
              height: 60,
              color: Color(hexColor("CABBA9")),
              constraints: BoxConstraints.tightForFinite(
                width: 500,
              ),
              child: Row(children: [
                Icon(Icons.chevron_left_outlined),
                TextButton(onPressed: (){
                  Navigator.push(context,MaterialPageRoute(
                    builder: (context) => HomeScreen( currentUsers: currentUsers,),
                  ),
                  );
                }, child: Text("Back", style: TextStyle(
                  fontSize: 24,
                  fontFamily: "ShareTechMono",
                  color: Colors.black
                ),)),
                Container(
                  width: 50,
                ),
                Container(
                  child: Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 36,
                      fontFamily: "ShareTechMono",
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ]),
            ),
            Container(height: 10),
            Container(
                height: 130,
                constraints: BoxConstraints.tightForFinite(
                  width: 500,
                ),
                child: Container(
                  alignment: Alignment.center,
                  height: 20,
                  width: 20,
                  child: ClipOval(
                    child: Image.asset('assets/image/profile.png'),
                  ),
                )),
            Container(height: 20),
            Row(children: [
              Container(
                  child: Text(
                "   Name:" + currentUsers[0].name,
                style: TextStyle(fontSize: 24, fontFamily: "ShareTechMono"),
              ))
            ]),
                Container(height: 10,),
            Row(children: [
              Container(
                  child: Text(
                "   DoB:" + currentUsers[0].dob,//to be age in the future
                style: TextStyle(fontSize: 24, fontFamily: "ShareTechMono"),
              ))
            ]),
            Container(height: 10,),
            Row(children: [
              Container(
                  child: Text(
                "   Height:" + currentUsers[0].height,
                style: TextStyle(fontSize: 24, fontFamily: "ShareTechMono"),
              ))
            ]),
                Container(height: 10,),
            Row(children: [
              Container(
                  child: Text(
                "   Weight:" + currentUsers[0].weight,
                style: TextStyle(fontSize: 24, fontFamily: "ShareTechMono"),
              ))
            ]),
            RaisedButton(
                child: Text("Logout"),
                onPressed: () => {Navigator.pushNamed(context, '/login')}),
          ]))
        ]));
  }
}
