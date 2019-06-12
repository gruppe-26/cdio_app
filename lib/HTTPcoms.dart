import 'dart:convert';

import 'package:cdio_app/user.dart';
import 'package:http/http.dart' as http;

String SERVER_URL = "http://localhost:8080/rest/userFlutter";

Future<dynamic> addUserToList(User user) async {

  return requestMethod(
      url: SERVER_URL, data: user);
}

requestMethod({String url, User data}) async {
  var body = json.encode(data);
  print("tilføjer ny user");
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