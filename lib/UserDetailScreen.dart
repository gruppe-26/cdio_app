import 'package:flutter/material.dart';
import 'user.dart';

class UserDetailScreen extends StatelessWidget {
  // Field that holds the User.
  final User user;

  // In the constructor, require a User.
  UserDetailScreen({Key key, @required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.userId.toString() + ": " + user.userName),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(80.0),
          ),
          Container(
            alignment: Alignment.center,
              child:
              Text("ID: " +
              user.userId.toString() +
              "\nName: " +
              user.userName +
              "\nInitials: " +
              user.ini +
              "\nPassword: " +
              user.password +
              "\nRoles: " +
              user.roles.toString(),
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
          )),
          Padding(
            padding: EdgeInsets.all(50.0),
          ),
          Container(
            height: 55,
            width: 150,
          child: Material(
            borderRadius: BorderRadius.circular(20.0),
            shadowColor: Colors.blueAccent,
            color: Colors.blue,
            elevation:5.0,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'updateuser', arguments: user);}, //TODO:  Update user and return to userlist
              child: Center(
                child: Text(
                  'Update this User',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          )
        ],
      ),
    );
  }
}

/*
child: Container(
        height: 30,
        width: 95,
        child: Material(
          borderRadius: BorderRadius.circular(20.0),
          shadowColor: Colors.blueAccent,
          color: Colors.blue,
          elevation:3.0,
          child: GestureDetector(
            onTap: () {},
            child: Center(
              child: Text(
                'password',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
 */