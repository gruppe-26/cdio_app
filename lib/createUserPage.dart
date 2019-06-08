import 'package:flutter/material.dart';
// This main.dart contains the login page.
void main()=> runApp(new MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
        home: new CreateUserPage(), // This will be the loginpage, calling the login class below
        theme : new ThemeData(
            primarySwatch: Colors.blue
        )
    );
  }
}

class CreateUserPage extends StatefulWidget{// Using statefulwidget because we will use animations

  @override
  State createState() => new UserCreationFormState();
}

class UserCreationFormState extends State<CreateUserPage> with SingleTickerProviderStateMixin{
  String _userName;
  String _firstName;
  String _initials;
  int _CPR;
  String _password;
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
                            labelText: "Username",
                          ),
                          keyboardType: TextInputType.text,
                          onSaved: (value) => this._userName = value,

                        ),
                        Text(_userName),
                        new TextFormField(
                          decoration: new InputDecoration(
                            labelText: "First Name",
                          ),
                          keyboardType: TextInputType.text,
                        ),

                        new TextFormField(
                          decoration: new InputDecoration(
                            labelText: "Initials",
                          ),
                          keyboardType: TextInputType.text,

                        ),

                        new TextFormField(
                          decoration: new InputDecoration(
                            labelText: "CPR",
                          ),
                          keyboardType: TextInputType.text,
                        ),

                        new TextFormField(
                          decoration: new InputDecoration(
                            labelText: "Password",
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                        new Padding(
                          padding: const EdgeInsets.only(top:20.0),
                        ),
                        new MaterialButton(
                          color: Colors.blueAccent,
                          textColor: Colors.white,

                          child: new Text("Create User"),
                          onPressed: () => {},
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