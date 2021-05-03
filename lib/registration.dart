import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';

class RegisterPage extends StatelessWidget {

  var name;
  var dob;
  var weight;
  var height;
  var username;
  var password;

  Map<String, dynamic> toJson() {
    return {
      'name': this.name,
      'dob': this.dob,
      'weight': this.weight,
      'height': this.height,
      'username':this.username,
      'password': this.password
    };
  }


  int hexColor(String colorCode) {
    String colorstr = '0xff' + colorCode;
    int colorint = int.parse(colorstr);
    return colorint;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(hexColor("F6EBE0")),
        body: ListView(children: [
          SingleChildScrollView(
              child: Column(children: [
            //Header
            Container(
              height: 100,
              color: Color(hexColor('CABBA9')),
              constraints: BoxConstraints.tightForFinite(
                width: 500,
              ),
              child: Text(
                "Create Your \nProfile",
                style: TextStyle(
                  fontSize: 36,
                  fontFamily: 'Righteous',
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            //picture input
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
            //Name
            Row(children: <Widget>[
              Container(width: 5),
              Container(
                child: Text(
                  '       Name:',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Righteous',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(width: 10),
              Expanded(
                flex: 2,
                child: Container(
                  height: 35,
                  child: TextField(
                    onChanged: (value){
                      name = value;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      fillColor: Color(hexColor('C4C4C4')),
                      filled: true,
                    ),
                  ),
                ),
              ),
              Container(width: 30)
            ]),
            Container(
              height: 20,
              constraints: BoxConstraints.tightForFinite(
                width: 500,
              ),
            ),
            //BirthDate
            Row(children: <Widget>[
              Container(width: 5),
              Container(
                child: Text(
                  ' BirthDate:',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Righteous',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(width: 10),
              Expanded(
                flex: 2,
                child: Container(
                  height: 35,
                  child: TextField(
                    onChanged: (value){
                       dob = value;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      fillColor: Color(hexColor('C4C4C4')),
                      filled: true,
                    ),
                  ),
                ),
              ),
              Container(width: 30)
            ]),
            Container(
              height: 20,
              constraints: BoxConstraints.tightForFinite(
                width: 500,
              ),
            ),
            //weight
            Row(children: <Widget>[
              Container(width: 5),
              Container(
                child: Text(
                  '     Weight:',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Righteous',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(width: 10),
              Expanded(
                flex: 2,
                child: Container(
                  height: 35,
                  child: TextField(
                    onChanged: (value){
                      weight = value;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      fillColor: Color(hexColor('C4C4C4')),
                      filled: true,
                    ),
                  ),
                ),
              ),
              Container(width: 30)
            ]),
            Container(
              height: 20,
              constraints: BoxConstraints.tightForFinite(
                width: 500,
              ),
            ),
            //height
            Row(children: <Widget>[
              Container(width: 5),
              Container(
                child: Text(
                  '      Height:',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Righteous',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(width: 10),
              Expanded(
                flex: 2,
                child: Container(
                  height: 35,
                  child: TextField(
                    onChanged: (value){
                      height = value;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      fillColor: Color(hexColor('C4C4C4')),
                      filled: true,
                    ),
                  ),
                ),
              ),
              Container(width: 30)
            ]),
            Container(
              height: 20,
              constraints: BoxConstraints.tightForFinite(
                width: 500,
              ),
            ),
            //username
            Row(children: <Widget>[
              Container(width: 5),
              Container(
                child: Text(
                  'Username:',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Righteous',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(width: 10),
              Expanded(
                flex: 2,
                child: Container(
                  height: 35,
                  child: TextField(
                    onChanged: (value){
                      username = value;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      fillColor: Color(hexColor('C4C4C4')),
                      filled: true,
                    ),
                  ),
                ),
              ),
              Container(width: 30)
            ]),
            Container(
              height: 20,
              constraints: BoxConstraints.tightForFinite(
                width: 500,
              ),
            ),
            //password
            Row(children: <Widget>[
              Container(width: 5),
              Container(
                child: Text(
                  ' Password:',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Righteous',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(width: 10),
              Expanded(
                flex: 2,
                child: Container(
                  height: 35,
                  child: TextField(
                    onChanged: (value){
                      password = value;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      fillColor: Color(hexColor('C4C4C4')),
                      filled: true,
                    ),
                  ),
                ),
              ),
              Container(width: 30)
            ]),
            Container(height: 30),
            Row(
              children: [
                Container(width:20),
                Expanded(
                  child: RaisedButton(
                    child: Text(
                      'Finished',
                      style: TextStyle(fontSize: 20,fontFamily: 'Righteous',),
                    ),
                    onPressed: () => {
                      signUp(name, dob, weight, height, username, password),
                      Navigator.pushNamed(context, '/login')
                    },
                    color: Color(hexColor("F0E477")),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                ),
                Container(width:20),
                Expanded(
                  child: RaisedButton(
                    child: Text(
                      'Cancel',
                      style: TextStyle(fontSize: 20,fontFamily: 'Righteous',),
                    ),
                    onPressed: () =>
                    {Navigator.pushNamed(context, "/login")},
                    color: Color(hexColor("F0E477")),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                ),
                Container(width:20),
              ],
            )
          ]))
        ]));
  }

  signUp(String name, dob, weight, height, username, password) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {
      'name': this.name,
      'dob': this.dob,
      'weight': this.weight,
      'height': this.height,
      'username': this.username,
      'password': this.password,
    };

    print(name);

    if(name == null || dob == null || weight == null || height == null || username == null || password == null) {
      print("pass");
      return showDialog<void>(
          //context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Registration Fail"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text("Please fill all the field"),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          }
      );
    }

    var jsonResponse = null;
    var response = await http.post("https://stepalife-007019061-default-rtdb.firebaseio.com/data/user"+".json", body: jsonEncode(data));
    //print(response.statusCode);
    if(response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      if(jsonResponse != null) {
        sharedPreferences.setString("token", jsonResponse['token']);
        //Navigator.pushNamed(context, '/login');
      }
    }
    else {
      print(response.body);
    }
  }
}
