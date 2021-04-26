import 'package:flutter/material.dart';

class user {

  final String name;
  final String dob;
  final String weight;
  final String height;
  final String username;
  final String password;

  user({
    @required this.name,
    @required this.dob,
    @required this.weight,
    @required this.height,
    @required this.username,
    @required this.password
  });

  factory user.fromJson(Map<String, dynamic> json){
    return user(
      name: json['name'],
      dob: json['dob'],
      weight: json['weight'],
      height: json['height'],
      username: json['username'],
      password: json['password']
    );
  }

}