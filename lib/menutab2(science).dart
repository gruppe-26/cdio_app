import 'package:flutter/material.dart';

class MenuTab2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Tab 2 Layout (Science)"),
          new Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: new FlatButton.icon(
              onPressed: () {

              },
              color: Colors.blueAccent,
              textColor: Colors.white,
              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
              icon: const Icon(Icons.navigate_next, size: 18.0),
              label: const Text('Go To Details'),
            ),
          ),
        ],
      ),
    );
  }
}

