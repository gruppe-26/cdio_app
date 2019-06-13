import 'dart:convert';
import 'dart:async';

import 'package:cdio_app/user.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
//import 'dart:io';

String SERVER_URL = "http://10.16.172.159:8080/rest/userFlutter";
// Add/create user (@POST)
Future<dynamic> addUserToList(User user) async {

  return requestMethod(
      url: SERVER_URL, data: user);
}

// Helping methods for add/create user.
requestMethod({String url, User data}) async {
  var body = json.encode(data);
  print("tilføjer ny user: "+body);
  Map<String, String> headers = {
    'Content-type': 'application/json',
  };
  print("doing stuff");
  final response = await http
      .post(url, body: body, headers: headers)
      .catchError((error) => print(error.toString()));
  print("wuhu!");
 // final responseJson = json.decode(response.body);
  // print(responseJson);

  return response;
} // end of add/create user


//void main() {
//  //Connect standard in to the socket
//  stdin.listen((data) => socket.write(new String.fromCharCodes(data).trim() + '\n'));
//}


// Get specific user with id (@GET)
Future<User> getUser(int id) async {
  final response = await http.get(SERVER_URL+"/"+id.toString()); //server url + /id
  if (response.statusCode == 200) {
    // If server returns an OK(200) response, parse the JSON.
    return User.fromJson(jsonDecode(response.body));
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

