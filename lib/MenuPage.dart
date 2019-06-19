import 'package:flutter/material.dart';

//next level
import 'ProfileTab.dart';
import 'UserListTab.dart';
import 'CreateUserTab.dart';


class OtherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                new Image.asset("assets/1280px-Aperture_Laboratories_Logo.png", fit: BoxFit.cover,
                height: 64,
                ),
              ]
            ),
            // This removes the back button so that you can only reach the login page by logging out.
            actions: <Widget>[
              new IconButton(
                icon: new Icon(null),
              ),
            ],
            leading: new Container(),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.account_box),text: "Profile",),
                Tab(icon: Icon(Icons.camera),text: "User List",),
                Tab(icon: Icon(Icons.supervised_user_circle), text: "Create new User",),
              ],
            ),
          ),

          body: new TabBarView(
            children:<Widget>[ // Each child is the content for each of the 3 tabs.
              new ProfilTab(),
              new UserListTab(),
              new CreateUserForm(),
            ],
          )),

        );
  }
}

