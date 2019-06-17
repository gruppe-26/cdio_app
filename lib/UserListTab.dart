import 'package:flutter/material.dart';
import 'loginpage.dart';
import 'MenuPage.dart';
import 'user.dart';
import 'UserDetailScreen.dart';
import 'package:cdio_app/Controller.dart';
import 'dart:async';

Controller c = new Controller();

// StatefulWidget with createState()-method.
class UserListTab extends StatefulWidget {
  UserListTab(); //Constructor
  @override
  _UserListTabState createState() => _UserListTabState();
}

class _UserListTabState extends State<UserListTab> {
  List<User> _userList;

  @override
  void initState() {
    super.initState();
    _fetchList();
  }

  Future _fetchList() async {
    List<User> users = await c.getUserList();
    setState(() {
      _userList = users;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(title: new Text("Brugere i systemet:"),
          automaticallyImplyLeading: false, // Removes the return button on the appbar.
        ),
        body: ListView.builder(
            itemCount: _userList.length,
            itemBuilder: (context, index){
              return Card (
                child: ListTile(
                  //                  title: Text(_userList[index].userId.toString()+": "+_userList[index].userName),
                  leading: Text(_userList[index].userId.toString(), style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                  title: Text(_userList[index].userName),
                  subtitle: Text(_userList[index].roles.toString()),

                  onTap:() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserDetailScreen(user: _userList[index]),
                      ),
                    );
                  },
                ),
              );
            }
        )
    );
  } //end of build



}
