import 'package:flutter/material.dart';


class MenuTab3 extends StatelessWidget {
  String _userName;
  String _firstName;
  String _initials;
  int _CPR;
  String _password;
  final _formKey = GlobalKey<FormState>();

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
                            onSaved: (value) => this._userName = value,

                          ),

                          new TextFormField(
                            decoration: new InputDecoration(
                              labelText: "First Name",
                              hintText: 'e.g Mikkel Mikkelsen',
                            ),
                            keyboardType: TextInputType.text,
                            onSaved: (value) => this._firstName = value,
                          ),

                          new TextFormField(
                            decoration: new InputDecoration(
                                labelText: "Initials",
                                hintText: '3 letter abbreviation'
                            ),
                            keyboardType: TextInputType.text,
                            onSaved: (value) => this._initials = value,
                          ),

                          new TextFormField(
                            decoration: new InputDecoration(
                              labelText: "Password",
                              hintText: 'Probably a good idea to keep it a secret ;)',
                            ),
                            keyboardType: TextInputType.text,
                            onSaved: (value) => this._password = value,
                            obscureText: true,
                          ),


                          new Padding(
                            padding: const EdgeInsets.only(top:20.0),
                          ),
                          new MaterialButton(
                            color: Colors.blueAccent,
                            textColor: Colors.white,
                            child: new Text("Create User"),

                            onPressed: () {
                              Navigator.pushNamed(context, '/otherPage');
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