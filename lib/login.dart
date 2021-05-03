import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'user.dart';
import 'mainpage.dart';

class Login extends StatefulWidget {
  @override
  _Login createState() => new _Login();
}

class _Login extends State<Login> {
  int hexColor(String colorCode) {
    String colorstr = '0xff' + colorCode;
    int colorint = int.parse(colorstr);
    return colorint;
  }

  List<user> parseUsers(String responseBody) {
    List<user> tempUsers = [];
    final extractUsers = json.decode(responseBody) as Map<String, dynamic>;
    extractUsers.forEach((key, value) {
      tempUsers.add(user(
          name: value['name'],
          dob: value['dob'],
          weight: value['weight'],
          height: value['height'],
          username: value['username'],
          password: value['password']));
    });
    return tempUsers;
    // final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    // return parsed.map<user>((json) => user.fromJson(json)).toList();
  }

  var username;
  var password;

  List<user> users;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(hexColor('F6EBE0')),
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
                  fontFamily: 'Righteous',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                width: 300,
                height: 45,
                child: TextField(
                  onChanged: (value) {
                    username = value;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    fillColor: Color(hexColor('FFD8D8')),
                    filled: true,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  ),
                ),
              ),
              Text(
                'Password',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Righteous',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                width: 300,
                height: 45,
                child: TextField(
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(width: 1),
                    ),
                    fillColor: Color(hexColor('FFD8D8')),
                    filled: true,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  ),
                  obscureText: true,
                ),
              ),
              Container(height: 20),
              Container(
                width: 250,
                height: 40,
                child: RaisedButton(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Righteous',
                    ),
                  ),
                  onPressed: () => {
                    signIn(username, password),
                    //Navigator.pushNamed(context, "/profile")
                  },
                  color: Colors.black,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              Container(height: 20),
              Text(
                '------- OR -------',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Righteous',
                ),
              ),
              Container(height: 20),
              Container(
                width: 250,
                height: 40,
                child: RaisedButton(
                  child: Text(
                    'Create New Account',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Righteous',
                    ),
                  ),
                  onPressed: () => {Navigator.pushNamed(context, "/register")},
                  color: Color(hexColor("F0E477")),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              )
            ]),
            //theme: ThemeData(primarySwatch: Colors.'0xffE5E5E5'),
          ),
        ],
      ),
    );
  }

  signIn(String username, password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // Map data = {
    //   'username': this.username,
    //   'password': this.password,
    // };

    if(username == null && password == null){
      return showDialog<void>(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Login Fail"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text("Incorrect User or Password"),
                    Text("Please Try Again"),
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
          });
    }

    print(username);
    var jsonResponse = null;
    var response = await http.get(
        "https://stepalife-007019061-default-rtdb.firebaseio.com/data/user" +
            ".json?username=" +
            username);
    print(response);
    print(response.statusCode);
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      if (jsonResponse != null) {
        sharedPreferences.setString("token", jsonResponse['token']);
        users = parseUsers(response.body);
        int count = 0;
        for (int i = 0; i < users.length; i++) {
          if (users[i].password == this.password) {
            List<user> currentUser = [];
            currentUser.add(user(
                name: users[i].name,
                dob: users[i].dob,
                weight: users[i].weight,
                height: users[i].height,
                username: users[i].username,
                password: users[i].password));
            print(users[i]);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(currentUsers: currentUser),
              ),
            );
          } else {
            count = count + 1;
          }
        }
        if (count == users.length) //Navigator.pushNamed(context, "/login");
          return showDialog<void>(
              context: context,
              barrierDismissible: false, // user must tap button!
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Login Fail"),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        Text("Incorrect User or Password"),
                        Text("Please Try Again"),
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
              });
      } else {
        throw Exception('Unable to fetch products from the REST API');
      }
    }
  }
}
