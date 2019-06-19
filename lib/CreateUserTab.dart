import 'dart:convert';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:flutter/material.dart';
import 'Controller.dart';
import 'user.dart';
import 'package:http/http.dart' as http;
import 'package:cdio_app/BackendDAO.dart';

Controller c = new Controller();

class CreateUserForm extends StatefulWidget {
  @override
   createState() => _MenuTab3();
}

class _MenuTab3 extends State<CreateUserForm> {
  final _userID = TextEditingController();
  final _username = TextEditingController();
  final _initials = TextEditingController();
  final _password = TextEditingController();
  final _role = TextEditingController();

  bool ad = false;
  bool pharma = false;
  bool prod = false;
  bool lab = false;
  List<String> arrayList;
  String Admin="Admin";
  String Pharmaceut="Pharmacist";
  String ProductionLeader="Production Leader";
  String Laborant="Laborant";

  List<String> roles = new List();

  // lister
  List<DropdownMenuItem<CheckboxListTile>> listDrop =[];
  var checkbox1 = false;
  var checkbox2 = false;
  var checkbox3 = false;
  var checkbox4 = false;

  void change1(bool val){
    setState(() {
      checkbox1 = val;
    });
  }
  void change2(bool val){
    setState(() {
      checkbox2 = val;
    });
  }
  void change3(bool val){
    setState(() {
      checkbox3 = val;
    });
  }
  void change4(bool val){
    setState(() {
      checkbox4 = val;
    });
  }


  //laver vores egen checkboxlist

  @override
  void dispose() {
    _userID.dispose();
    _username.dispose();
    _initials.dispose();
    _password.dispose();
    _role.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      backgroundColor: Colors.blue,
      body: SingleChildScrollView( // Allows to
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
                      color: Colors.blue,
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
                            controller: _username,
                          ),

                          new TextField(
                            decoration: new InputDecoration(
                                labelText: "Initials",
                                hintText: '3 letter abbreviation'
                            ),
                            keyboardType: TextInputType.text,
                            controller: _initials,
                          ),

                          new TextField(
                            decoration: new InputDecoration(
                              labelText: "Password",
                              hintText: 'Probably a good idea to keep it a secret ;)',
                            ),
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            controller: _password,
                          ),

                        CheckboxListTile(
                        value: checkbox1, onChanged: change1, title: Text("Admin")),

                        CheckboxListTile(
                          value: checkbox2, onChanged: change2, title: Text("Pharmacist")),

                        CheckboxListTile(
                         value: checkbox3, onChanged: change3, title: Text("Production Leader")),

                        CheckboxListTile(
                         value: checkbox4, onChanged: change4, title: Text("Laborant")),

                          new MaterialButton(
                            minWidth: 500,
                            height: 50.0,
                            color: Colors.white,
                            textColor: Colors.blue,
                            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                            child: new Text("Create User", style: new TextStyle(fontSize: 18)),

                            onPressed: () async {

                              if(checkbox1 == true){
                                roles.add("Admin");
                              }

                              if(checkbox2 == true){
                                roles.add("Pharmacist");
                              }

                              if(checkbox3 == true){
                                roles.add("Production Leader");
                              }

                              if(checkbox4 == true){
                                roles.add("Laborant");
                              }
                              // The user starts with no ID in the frontend. It is generated on the tomcat server
                              User user = new User(null,_username.text, _initials.text, _password.text, roles);
                              await c.createUser(user);

                              roles.clear();
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

Widget checkBox(String role, bool roleValue){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text(role),
      Checkbox(value: roleValue,
        onChanged: (bool value){},
      )
    ],
  );
}