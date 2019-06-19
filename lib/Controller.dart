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
import 'BackendDAO.dart';

class Controller {
  Controller();

  static User currentUser;

  BackendDAO dao = new BackendDAO();

  //Getter
  User getUser(){
    return currentUser;
  }

  // logIn method. Checks logIn and sets currentuser if login is correct.
  Future<bool> logIn(User loginUser) async{
    bool _loggedIn;
    User loggedInUser = await dao.checkLogin(loginUser); // Receive user from server
    if (loggedInUser != null)
      {
        currentUser = loggedInUser;
        _loggedIn = true;
      } else {
      _loggedIn = false;
    }
    return _loggedIn;
  }


  Future<List<User>> getUserList() async{
    List<User> userList = await dao.getUsersAll();
    print("ROLE PRINT TEST");
    print(userList[1].roles.elementAt(0));
    return userList;
  }

  delete(int id) async{
    dao.deleteUser(id);
  }

}



