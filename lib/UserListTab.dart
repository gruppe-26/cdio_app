import 'package:flutter/material.dart';
import 'loginpage.dart';
import 'MenuPage.dart';
import 'user.dart';
import 'UserDetailScreen.dart';
import 'package:cdio_app/Controller.dart';
import 'dart:async';
class UserListTab extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return new MaterialApp(
      home: new ListDisplay(),
    );
  }
}
// Currently fucky wucky problems with future+_userlist
class ListDisplay extends StatelessWidget {
  List<User> _userList;

  @override
  Widget build (BuildContext context)  {
    _userList = createUserList() as List<User>;
    return new Scaffold(
        appBar: new AppBar(title: new Text("Dynamic User List"),),
        body: ListView.builder(
          itemCount:_userList.length,
          itemBuilder: (context, index){
            return ListTile(
             // title: Text(_userList[index].userId.toString()+": "+_userList[index].userName),
              title: Text(_userList[index].userId.toString()+": "+_userList[index].userName),
              onTap:() {
                Navigator.push(
                 context,
                 MaterialPageRoute(
                  builder: (context) => UserDetailScreen(user: _userList[index]),
                 )
                    // User for debug: User(2,"Stig","SMN","Kat123",null)
                );
              }
            );
          }
        )
    );
  }
}

/*
ListView.builder(
          itemCount:_userList.length,
          itemBuilder: (context, index){
            return ListTile(
             // title: Text(_userList[index].userId.toString()+": "+_userList[index].userName),
              title: Text(_userList[index].userId.toString()+": "+_userList[index].userName),
              onTap:() {
                Navigator.push(
                 context,
                 MaterialPageRoute(
                  builder: (context) => UserDetailScreen(user: _userList[index]),
                 )
                    // User for debug: User(2,"Stig","SMN","Kat123",null)
                );
              }
            );
          }
        )
 */