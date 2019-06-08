import 'package:flutter/material.dart';
// This main.dart contains the login page.
void main()=> runApp(new MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
        home: new LoginPage(), // This will be the loginpage, calling the login class below
        theme : new ThemeData(
            primarySwatch: Colors.blue
        )
    );
  }
}

class LoginPage extends StatefulWidget{ // Using statefulwidget because we will use animations
  @override
  State createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin{
  // Before override, we create an animation for the flutter logo on the login page on startup
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  @override
  void initState(){
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this,
        duration: new Duration(milliseconds: 640)
    );
    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController,
        curve: Curves.easeIn
    );
    _iconAnimation.addListener(()=> this.setState((){}));
    _iconAnimationController.forward();
  }

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
                          color: Colors.blueAccent,
                          textColor: Colors.white,

                          child: new Text("Login"),
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