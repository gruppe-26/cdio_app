import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:core' as prefix0;
import 'dart:core';
import 'dart:math';

import 'package:cdio_app/user.dart';
import 'package:flutter/material.dart';

//other imports

import 'loginpage.dart';
import 'MenuPage.dart';
import 'loginUser.dart';
import 'package:cdio_app/Validator.dart';
import 'HTTPcoms.dart';
import 'user.dart';

class  UserSingleton {

  static  final  UserSingleton _User = UserSingleton._internal();
  factory UserSingleton () => _User;
  UserSingleton._internal () {
    // init things inside this
    User get(int id){
    }

  }

// Methods, variables ...
}