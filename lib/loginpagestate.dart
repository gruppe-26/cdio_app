import 'package:flutter/material.dart';

//other imports
import 'loginpage.dart';
import 'otherPage.dart';


class LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin{
  // Before override, we create an animation for the flutter logo on the login page on startup

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
                            labelText: "Enter Username",
                          ),
                          keyboardType: TextInputType.text,
                        ),
                        new TextFormField(
                          decoration: new InputDecoration(
                            labelText: "Enter Password",
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true,
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
                          child: new Text("Login"),
                          onPressed: () {
                            Navigator.pushNamed(context, '/otherPage');
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