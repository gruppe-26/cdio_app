import 'package:flutter/material.dart';

class MenuTab1 extends StatelessWidget {
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
                Navigator.pop(context);
              },
              color: Colors.red,
              textColor: Colors.white,
              icon: const Icon(Icons.hotel, size: 18.0),
              label: const Text('Log out'),
            ),
          ),
        ],
      ),
    );
  }
}