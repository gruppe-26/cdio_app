import 'package:flutter/material.dart';

class User {
  String username;
  String name;
  String initials;
  String password;
  List<String> roles;


  User(this.username, this.name, this.initials, this.password,this.roles);

  User.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        name = json['name'],
        initials = json['initials'],
        password = json['password'],
        roles = json['roles'];

  Map<String, dynamic> toJson() => {
    'username': username,
    'name': name,
    'initials': initials,
    'password': password,
    'role' : roles,
  };

}