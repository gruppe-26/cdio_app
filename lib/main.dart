import 'package:flutter/material.dart';

//other imports
import 'otherPage.dart';
import 'loginpage.dart';


// This main.dart contains the login page.
void main()=> runApp(new MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
        home: new LoginPage(), // This will be the loginpage, calling the login class below
        theme : new ThemeData(
            primarySwatch: Colors.blue
        ),
      initialRoute: 'home',
      routes: {
        'home': (context) => LoginPage(),

        '/otherPage': (context) => OtherScreen(),
      },
    );
  }
}

//djsalkfja

