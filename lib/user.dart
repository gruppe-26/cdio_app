import 'package:flutter/material.dart';

class User {
  String username;
  String name;
  String initials;
  String password;

  User(this.username, this.name, this.initials, this.password);

  User.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        name = json['name'],
        initials = json['initials'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
    'username': username,
    'name': name,
    'initials': initials,
    'password': password,
  };

}