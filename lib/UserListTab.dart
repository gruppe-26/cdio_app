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
        appBar: new AppBar(title: new Text("Brugere i systemet:"),),
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






//class UserListTab extends StatelessWidget {
//  @override
//  Widget build(BuildContext ctxt) {
//    return new MaterialApp(
//      home: new ListDisplay(),
//    );
//  }
//}
//// Currently fucky wucky problems with future+_userlist
//class ListDisplay extends StatelessWidget {
//  List<User> _userList;
//
//  @override
//  Widget build (BuildContext context)  {
//    _userList = createUserList() as List<User>;
//    return new Scaffold(
//        appBar: new AppBar(title: new Text("Dynamic User List"),),
//        body: ListView.builder(
//          itemCount:_userList.length,
//          itemBuilder: (context, index){
//            return ListTile(
//             // title: Text(_userList[index].userId.toString()+": "+_userList[index].userName),
//              title: Text(_userList[index].userId.toString()+": "+_userList[index].userName),
//              onTap:() {
//                Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                  builder: (context) => UserDetailScreen(user: _userList[index]),
//                 )
//                    // User for debug: User(2,"Stig","SMN","Kat123",null)
//                );
//              }
//            );
//          }
//        )
//    );
//  }
//}

/*
//ListView.builder(
//          itemCount:_userList.length,
//          itemBuilder: (context, index){
//            return ListTile(
//             // title: Text(_userList[index].userId.toString()+": "+_userList[index].userName),
//              title: Text(_userList[index].userId.toString()+": "+_userList[index].userName),
//              onTap:() {
//                Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                  builder: (context) => UserDetailScreen(user: _userList[index]),
//                 )
//                    // User for debug: User(2,"Stig","SMN","Kat123",null)
//                );
//              }
//            );
//          }
//        )
// */
