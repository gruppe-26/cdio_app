import 'package:flutter/material.dart';

//other imports
import 'loginpage.dart';
import 'otherPage.dart';


class LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin{
// Create a global key that will uniquely identify the Form widget and allow us to validate the form
  final _formKey = GlobalKey<FormState>();


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
                            labelText: "Enter Username",
                          ),
                          keyboardType: TextInputType.text,

                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Username incorrect.';
                            }
                            return null;
                          },
                        ),
                        new TextFormField(
                          decoration: new InputDecoration(
                            labelText: "Enter Password",
                          ),
                          keyboardType: TextInputType.text,
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
                          color: Colors.blueAccent,
                          textColor: Colors.white,

                          child: new Text("Login"),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              // often want to call a server or save the information in a database
                              // If the form is filled out, then go to profile page. In reality we need to check the username/password
                              //TODO: Connect login state with backend/database and confirm credentials
                              Navigator.pushNamed(context, '/otherPage');
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