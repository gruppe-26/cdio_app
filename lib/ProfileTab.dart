import 'package:flutter/material.dart';

import 'loginpagestate.dart';
import 'loginpage.dart';

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Tab 1 Layout (Profile)"),
          new Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: new FlatButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },

              color: Colors.blueAccent,
              textColor: Colors.white,
              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
              icon: const Icon(Icons.hotel, size: 18.0),
              label: const Text('Log out'),
            ),
          ),
        ],
      ),
    );
  }
}