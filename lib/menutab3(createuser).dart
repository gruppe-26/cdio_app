import 'package:flutter/material.dart';
import 'user.dart';


class MyCustomForm extends StatefulWidget {
  @override
   createState() => _MenuTab3();
}

class _MenuTab3 extends State<MyCustomForm> {
  String _username;
  String _name;
  String _initials;
  String _password;

  final textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black38,
      body: SingleChildScrollView(
        child: new Stack(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new Form(

                  child: new Theme(
                    data: new ThemeData(
                        brightness: Brightness.dark, primarySwatch: Colors.blue,
                        inputDecorationTheme: new InputDecorationTheme(
                            labelStyle: new TextStyle(color: Colors.white,fontSize: 20.0))),
                    child: Container(
                      padding: const EdgeInsets.all(40.0),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.center ,
                        children: <Widget>[
                          new TextField(
                            decoration: new InputDecoration(
                              labelText: "Username",
                              hintText: 'e.g Dragonslayer69',

                            ),
                            keyboardType: TextInputType.text,
                            controller: textEditingController,
                          ),

                          new TextField(
                            decoration: new InputDecoration(
                              labelText: "First Name",
                              hintText: 'e.g Mikkel Mikkelsen',
                            ),
                            keyboardType: TextInputType.text,
                            controller: textEditingController,
                          ),

                          new TextField(
                            decoration: new InputDecoration(
                                labelText: "Initials",
                                hintText: '3 letter abbreviation'
                            ),
                            keyboardType: TextInputType.text,
                            controller: textEditingController,
                          ),

                          new TextField(
                            decoration: new InputDecoration(
                              labelText: "Password",
                              hintText: 'Probably a good idea to keep it a secret ;)',
                            ),
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            controller: textEditingController,
                          ),


                          new Padding(
                            padding: const EdgeInsets.only(top:20.0),
                          ),
                          new MaterialButton(
                            minWidth: 500,
                            height: 50.0,
                            color: Colors.blueAccent,
                            textColor: Colors.white,
                            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                            child: new Text("Create User"),

                            onPressed: () {
                              return showDialog(context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Text(textEditingController.text),
                                );
                              });

                                //Navigator.pushNamed(context, '/otherPage');
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],

            ),
          ],
        ),
      ),
    );
  }
}