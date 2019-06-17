import 'dart:convert';
import 'dart:async';
import 'dart:convert' as prefix0;
import 'package:cdio_app/loginUser.dart';
import 'package:cdio_app/user.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'MenuPage.dart';
import 'loginpagestate.dart';

// TODO: HUSK AT SKIFT IP ADDRESSEN TIL DIN NUVÆRENDE IPV4 ADDRESS!!!!
String SERVER_URL = "http://10.16.164.201:8080/rest/userFlutter";


// Add/create user (@POST)
Future<dynamic> addUser(User user) async {
  return requestMethod(
      url: SERVER_URL, data: user);
}
// Helping methods for add/create user.
requestMethod({String url, User data}) async {
  var body = json.encode(data);
  print("Forsøger at tilføje ny bruger:\n"+body);
  Map<String, String> headers = {
    'Content-type': 'application/json',
  };
  final response = await http
      .post(url, body: body, headers: headers)
      .catchError((error) => print(error.toString()));
  if(response.statusCode == 200)
    {
      print("Bruger tilføjet. Det gik godt!");
    }
    else {
      print("Noget gik galt. BrugerID eksisterer allerede. Tjek backend-terminal");
  }
  return response;
} // end of add/create user




// Get specific user with id (@GET)
Future<User> getUser(int id) async {
  print("brugerID der prøves at hentes: "+id.toString());
  final response = await http.get(SERVER_URL+"/"+id.toString()); //server url + /id
  if (response.statusCode == 200) {
    // If server returns an OK(200) response, parse the JSON.
//    var data = response.body;
//    print("response body: "+data); //så printer den en jsonEncoded user.
    var userMap = jsonDecode(response.body); // jsonDecode laver json-strengen til en Map<String, dynamic>,
    var user = User.fromJson(userMap); // Herefter laver User.fromJson-metoden en User ud fra denne Map(se hvordan i User).
    return user;
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load user');
  }
}

// Get all users (@GET)
Future<List<User>> getUsersAll() async {
  final response = await http.get(SERVER_URL);
  if (response.statusCode == 200) {
    // If server returns an OK(200) response, parse the JSON using helping method 'parseUsers'.
    // Using the compute function to run parseUsers in a separate isolate. Helps performance on slower devices.
    return compute(parseUsers, response.body);
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load user');
  }
}
// A helping function for getUsersAll to convert a response body into a List<User>.
List<User> parseUsers(String responseBody) {
  // Caster til en Map<String, dynamic>, da responseBody-JSON'en, egentlig er en Liste af disse User-Maps.
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<User>((json) => User.fromJson(json)).toList();
}


Future<dynamic> deleteUser(int id) async {
  final response = await http.delete(SERVER_URL+"/"+id.toString());
  print("Nu forsøges bruger med id: "+id.toString()+", at slettes...");
  if (response.statusCode == 200)
    {
      print("Delete statuscode 200 var true");
      print(response.body); // besked defineret i @delete i backend
    } else {
    print("Delete statuscode 200 var falsk");
    print(response.body); //besked defineret i @delete i backend
  }
}








Future<User> checkLogin(User loginUser) async {
  var body = json.encode(loginUser);
  Map<String, String> headers = {
    'Content-type': 'application/json',
  };
  final response = await http
      .post(SERVER_URL + '/login', body: body, headers: headers)
      .catchError((error) => print(error.toString()));
  print(response.body);
  if (response.statusCode == 200) {
    var userMap = jsonDecode(response.body); // jsonDecode laver json-strengen til en Map<String, dynamic>,
    var user = User.fromJson(userMap);    print("Success! Status code is:");
    // print(response.statusCode);
    return user;
  }
  else {
    print('Login information incorrect');
    return null;
  }
}




