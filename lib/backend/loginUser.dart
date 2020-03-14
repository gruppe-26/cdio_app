import 'package:flutter/material.dart';

class LoginUser {
  String username;
  String password;

  LoginUser(this.username, this.password);

  LoginUser.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
    'username': username,
    'password': password,
  };

}