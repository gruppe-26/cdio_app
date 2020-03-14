import 'package:cdio_app/states/GameTab.dart';
import 'package:flutter/material.dart';

//next level

class GameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
        length: 1,
        child: Scaffold(
          appBar: AppBar(

            // This removes the back button so that you can only reach the login page by logging out.
            actions: <Widget>[
              new IconButton(
                icon: new Icon(null),
              ),
            ],
            leading: new Container(),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.account_box),text: "Galgeleg",)
              ],
            ),
          ),

          body: new TabBarView(
            children:<Widget>[ // Each child is the content for each of the 3 tabs.
              new Game(),
            ],
          )),

        );
  }
}

