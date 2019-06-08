import 'package:flutter/material.dart';

class OtherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Other Screen'),
      ),
      body: Center(
        child: RaisedButton(
            color: Colors.red,
            child: Text('Go back'),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
    );
  }
}