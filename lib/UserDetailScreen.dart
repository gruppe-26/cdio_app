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
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text("ID: " +
            user.userId.toString() +
            "\nName: " +
            user.userName +
            "\nInitials: " +
            user.ini +
            "\nPassword: " +
            user.password +
            "\nRoles: " +
            user.roles.toString()),
      ),
    );
  }
}
