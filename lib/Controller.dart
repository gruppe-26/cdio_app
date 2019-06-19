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

BackendDAO dao = new BackendDAO();

class Controller {
  // Constructor
  Controller();

  // Fields
  static User currentUser;

  // Methods
  createUser(User user) {
    dao.addUser(user);
  }

  Future<User> logIn(User loginUser) async{
    User loggedInUser = await dao.checkLogin(loginUser); // Receive user from server
    currentUser = loggedInUser;
    return loggedInUser;
  }

  User getUser(){
    return currentUser;
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

  updateUser(User user) {
    dao.updateUser(user);
  }


}



