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

  Future<String> erSpilletTabt() async{
    final response = await http.get(SERVER_URL+"/erSpilletTabt");
    String statement = response.body;
    return statement;
  }

  Future<String> erSpilletVundet() async{
    final response = await http.get(SERVER_URL+"/erSpilletVundet");
    String statement = response.body;
    return statement;
  }

  Future<String> erSpilletSlut() async{
    final response = await http.get(SERVER_URL+"/erSpilletSlut");
    String statement = response.body;
    print("ER SPILLET SLUT RESPONSE: "+statement);
    return statement;
  }

  Future<String> getOrdet() async{
    final response = await http.get(SERVER_URL+"/getOrdet");
    String statement = response.body;
    return statement;
  }

  Future<String> getForkerteBogstaver() async{
    final response = await http.get(SERVER_URL+"/brugtebogstaver");
    String bogstaver = response.body;

    return bogstaver;
  }




}
