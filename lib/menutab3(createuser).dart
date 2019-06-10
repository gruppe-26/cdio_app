import 'package:flutter/material.dart';


class MenuTab3 extends StatelessWidget {
  String _userName;
  String _firstName;
  String _initials;
  int _CPR;
  String _password;
  final _formKey1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Colors.black38,
      body: SingleChildScrollView(
        child: new Stack(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new Form(
                  key: _formKey1,
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
                          new TextFormField(
                            decoration: new InputDecoration(
                              labelText: "Username",
                              hintText: 'e.g Dragonslayer69',
                            ),
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Username is Empty';
                              }
                              return null;
                            },
                          ),

                          new TextFormField(
                            decoration: new InputDecoration(
                              labelText: "First Name",
                              hintText: 'e.g Mikkel Mikkelsen',
                            ),
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'First name is Empty';
                              }
                              return null;
                            },
                          ),

                          new TextFormField(
                            decoration: new InputDecoration(
                                labelText: "Initials",
                                hintText: '3 letter abbreviation'
                            ),
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Initials is empty';
                              }
                              return null;
                            },
                          ),

                          new TextFormField(
                            decoration: new InputDecoration(
                              labelText: "Password",
                              hintText: 'Probably a good idea to keep it a secret ;)',
                            ),
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Password is empty.';
                              }
                              return null;
                            },
                          ),


                          new Padding(
                            padding: const EdgeInsets.only(top:20.0),
                          ),
                          new MaterialButton(
                            color: Colors.blueAccent,
                            textColor: Colors.white,
                            child: new Text("Create User"),

                            onPressed: () {
                              if (_formKey1.currentState.validate()) {
                                // often want to call a server or save the information in a database
                                // If the form is filled out, then go to profile page. In reality we need to check the username/password
                                //TODO: Connect create state with backend/database and confirm credentials
                                Navigator.pushNamed(context, '/otherPage');
                              }
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