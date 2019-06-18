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
import 'user.dart';
import 'HTTPcoms.dart';

class Controller {
  Controller();

  static User currentUser;

  Future<User> logIn(User loginUser) async{
    User loggedInUser = await checkLogin(loginUser); // Receive user from server
    currentUser = loggedInUser;
    return loggedInUser;
  }

  User getUser(){
    return currentUser;
  }

  Future<List<User>> getUserList() async{
    List<User> userList = await getUsersAll();
    print("ROLE PRINT TEST");
    print(userList[1].roles.elementAt(0));
    return userList;
  }

  delete(int id) async{
    deleteUser(id);
  }

}



