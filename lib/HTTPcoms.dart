import 'dart:convert';

import 'package:cdio_app/user.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:async';

String SERVER_URL = "http://192.168.0.29:8080/gruppe26_cdio3_war_exploded/rest/userFlutter";

Socket socket;

Future<dynamic> addUserToList(User user) async {

  return requestMethod(
      url: SERVER_URL, data: user);
}

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
  final responseJson = json.decode(response.body);
  print(responseJson);

  return response;
}

void main() {

  //Connect standard in to the socket
  stdin.listen((data) => socket.write(new String.fromCharCodes(data).trim() + '\n'));
}