import 'dart:convert';
import 'dart:core' as prefix0;
import 'dart:core';
import 'dart:math';
import 'Controller.dart';
import 'package:cdio_app/user.dart';
import 'package:flutter/material.dart';

//other imports

import 'loginpage.dart';
import 'MenuPage.dart';
import 'loginUser.dart';
import 'package:cdio_app/Validator.dart';
import 'HTTPcoms.dart';


class LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
// Create a global key that will uniquely identify the Form widget and allow us to validate the form
  final _formKey = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _password = TextEditingController();
  static User LoggedIn = new User(null,null,null,null,null);



  @override
  Widget build(BuildContext context){
    return new Scaffold(
      backgroundColor: Colors.black38,
      body: new Stack(
        fit: StackFit.expand, // Expands the background Image so it fits on the entire screen
        children: <Widget>[
          new Image(
            image: new AssetImage("assets/laboratoryPlaceholder.png"),
            fit: BoxFit.cover,
            color: Colors.black38,
            colorBlendMode: BlendMode.darken,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center, // Aligns logo to center
            children: <Widget>[
              new Image(
                image: new AssetImage("assets/1280px-Aperture_Laboratories_Logo.png"),
                width: 324,
              ),
              new Form(
                key: _formKey, // Here is the form key inside the form
                child: new Theme(
                  data: new ThemeData(
                      brightness: Brightness.dark, primarySwatch: Colors.teal,
                      inputDecorationTheme: new InputDecorationTheme(
                          labelStyle: new TextStyle(color: Colors.white,fontSize: 20.0))),
                  child: Container(
                    padding: const EdgeInsets.all(40.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.center ,
                      children: <Widget>[
                        new TextFormField(
                          decoration: new InputDecoration(
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(25.0),
                              borderSide: new BorderSide(
                              ),
                            ),
                            labelText: "Enter Username",
                              errorStyle: TextStyle(fontSize: 16.0),
                          ),
                          keyboardType: TextInputType.text,

                          controller: _username,

                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Username incorrect.';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 25.0,), // This creates an invisible box that creates a distance between the login fields
                        new TextFormField(
                          decoration: new InputDecoration(
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(25.0),
                              borderSide: new BorderSide(
                              ),
                            ),
                            labelText: "Enter Password",
                            errorStyle: TextStyle(fontSize: 18.0),
                          ),
                          keyboardType: TextInputType.text,

                          controller: _password,

                          obscureText: true,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Password incorrect.';
                            }
                            return null;
                          },
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
                          child: new Text("Login",
                          style: new TextStyle(fontSize: 18),
                          ),
                          onPressed: () async {
                            var loginUserCredentials = new User(null,_username.text,null,_password.text,null);
                            print("Du loggede ind med: ");
                            print(loginUserCredentials.toString());
                            if (_formKey.currentState.validate()) {
                              // If the form is filled out, then go to profile page. In reality we need to check the username/password
                              User currentlyLoggedIn = await logIn(loginUserCredentials);
                              print("Brugeren er hentet: ");
                              print(currentlyLoggedIn.toString());
                              if(currentlyLoggedIn.userId!=null){ // Check if the user exists
                                Navigator.pushNamed(context, '/otherPage');
                              }
                              else{
                                Text('Username and/or Password is incorrect');
                              }
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );


  }
}

class roundBorder{
  WidgetBuilder(BuildContext context){
    border: new OutlineInputBorder(
      borderRadius: new BorderRadius.circular(25.0),
      borderSide: new BorderSide(
      ),
    );
  }
}

class SnackBarMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SnackBar Message',
      home: Scaffold(
        appBar: AppBar(
          title: Text('SnackBar Message '),
        ),
      ),
    );
  }
}



























