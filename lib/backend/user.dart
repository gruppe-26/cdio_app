//import 'package:flutter/material.dart';
import 'dart:convert'; //importeres for at kunne bruge jsonEncode herinde.

// User  model/class
class User {
  // Fields
  String userName;
  String password;

  // User constructor.
  User(this.userName,this.password);

  // Metoder, hvor vi selv står for serialiseringen/konverteringen til JSON-format.

  // fromJson metode. Returnerer en user ud fra en Map<String, dynamic>, hvor K=String(fieldNavn), og V=dynamic(datatypen, kan være int, String, List<String> i vores tilfælde).
  factory User.fromJson(Map<String, dynamic> parsedJson) {
    // parsedJson er altså vores indkommende Map<String, dynamic>, som skal blive til en user.
    User user = new User(
        parsedJson['userName'],
        parsedJson['password'],);
    return user;
  }

  // toJson() metode, til at konvertere en 'User' instans til en Map-struktur.
  Map<String, dynamic> toJson() => {
    'userName': userName,
    'password': password,};

  // toString metode. Autogenereret. Primært til testning.
  @override
  String toString() {
    return 'User{userName: $userName, password: $password}';
  }

  String getUsername(){
    return userName;
  }
  String getPassword(){
    return password;
  }

}
// Note/dokumentation: https://flutter.dev/docs/development/data-and-backend/json#serializing-json-inside-model-classes