import 'dart:convert';
import 'dart:async';
import 'dart:convert' as prefix0;
import 'dart:math';
import 'package:cdio_app/backend/loginUser.dart';
import 'package:cdio_app/backend/user.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cdio_app/pages/MenuPage.dart';
import 'package:cdio_app/states/loginpagestate.dart';

// TODO: HUSK AT SKIFT IP ADDRESSEN TIL DIN NUVÆRENDE IPV4 ADDRESSE!!!!
String SERVER_URL = "http://192.168.0.23:8080";

class BackendDAO {
  Future<bool> checkLogin(User loginUser) async {
    var body = json.encode(loginUser);
    print("Her er body i BackendDAO: "+body);
    String username = loginUser.getUsername();
    String password = loginUser.getPassword();
    final response = await http
        .get(SERVER_URL + '/login?brugernavn='+username+'&adgangskode='+password)
        .catchError((error) => print(error.toString()));
    print("response: "+response.body);
    if (response.statusCode == 200) {

      return true;
    }
    else {
      print('Login information incorrect');
      return false;
    }
  }

  Future<String> startSpil() async{
    final response = await http.get(SERVER_URL+"/start");
    String synligtOrd = response.body;
    print("Synligt ord BODY: "+synligtOrd);
    return synligtOrd;
  }

  Future<String> guessOrd(String guess) async{
    final response = await http.get(SERVER_URL+"/gætbogstav?bogstav="+guess);
    print("Guess response: "+response.body);
    return getSynligtOrd();
  }

  Future<String> getSynligtOrd() async{
    final response = await http.get(SERVER_URL+"/getSynligtOrd");
    String synligtOrd = response.body;
    return synligtOrd;
  }

  Future<bool> erSidstebogstavKorrekt()async{
    final response = await http.get(SERVER_URL+"/erSidstebogstavKorrekt");
    bool statement = response.body as bool;
    return statement;
  }

  Future<bool> erSpilletTabt() async{
    final response = await http.get(SERVER_URL+"/erSpilletTabt");
    bool statement = response.body as bool;
    return statement;
  }

  Future<bool> erSpilletVundet() async{
    final response = await http.get(SERVER_URL+"/erSpilletVundet");
    bool statement = response.body as bool;
    return statement;
  }




}
