//import 'package:flutter/material.dart';
import 'dart:convert'; //importeres for at kunne bruge jsonEncode herinde.

// User  model/class
class User {
  // Fields
  String userId;
  String userName;
  String ini;
  String password;
  List<String> roles; // printes som: [rolle1, rolle2, rolle3,...,rolleN].

  // User constructor.
  User(this.userId, this.userName, this.ini, this.password, this.roles);

  // Metoder, hvor vi selv står for serialiseringen/konverteringen til JSON-format.

  // .Json constructor, til at konstruere en ny 'User' instans ud fra en Map-struktur.
  User.fromJson(Map<String, dynamic> json)
      : userId = json['userId'],
        userName = json['userName'],
        ini = json['ini'],
        password = json['password'],
        roles = json['roles'];

  // toJson() metode, til at konvertere en 'User' instans til en Map-struktur.
  Map<String, dynamic> toJson() => {
    'userId': userId,
    'userName': userName,
    'ini': ini,
    'password': password,
    'roles': roles,
  };

  @override
  String toString() {
    return 'User{userId: $userId, userName: $userName, ini: $ini, password: $password, roles: $roles}';
  }

// toString metode. Autogenereret. Primært til testning.

}

// Main til at teste. Brug evt. Dartpad(https://dartpad.dartlang.org/) i stedet.
void main () {
  print('Velkommen til: Bruger til JSON-testing \n');

//  List<String> roller = ["Admin", "Pharmaceut"]; //denne er "growable".
  List<String> roller = new List<String>(); //denne er også "growable".
  roller.add("Admin");
  roller.add("Pharmaceut");
  User bruger = new User("4", "Dragonslayer69", "TES", "Hundkat123", roller);

  print("-----");
  print("Print af roller: ");
  print(roller);
  print("-----");
  print("Print via bruger toString() -metode:");
  print(bruger); // det er jo bare toString()-metoden for objektet der kaldes, når man printer et objekt.
  print("-----");
  print("Print efter jsonEncode() -metodde:");
  var userJSON = jsonEncode(bruger); //jsonEncode kigger på objektets selvdefinerede metoder(fromJson, toJson) til konvertering til JSON.
  print(userJSON);
  print("-----");
}

// Note/dokumentation: https://flutter.dev/docs/development/data-and-backend/json#serializing-json-inside-model-classes