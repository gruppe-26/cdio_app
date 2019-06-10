import 'package:flutter/material.dart';

// Model class

class User {
  String username;
  String name;
  String initials;
  String password;
  List<String> roles; // printes som: [rolle1, rolle2, rolle3,...,rolleN].

  User(this.username, this.name, this.initials, this.password, this.roles);

  // Metoder, hvor vi selv står for serialiseringen/konverteringen til JSON-format.

  // .Json constructor, til at konstruere en ny 'User' instans ud fra en Map-struktur.
  User.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        name = json['name'],
        initials = json['initials'],
        password = json['password'],
        roles = json['roles'];

  // toJson() metode, til at konvertere en 'User' instans til en Map-struktur.
  Map<String, dynamic> toJson() => {
    'username': username,
    'name': name,
    'initials': initials,
    'password': password,
    'roles': roles,
  };

  // toString metode.
  @override
  String toString() {
    return 'User{username: $username, name: $name, initials: $initials, password: $password, roles: $roles}';
  }
}
