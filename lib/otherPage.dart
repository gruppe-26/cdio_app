import 'package:flutter/material.dart';


class TabBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.account_box)),
                Tab(icon: Icon(Icons.camera)),
                Tab(icon: Icon(Icons.chat)),
              ],
            ),
            title: Text('Tabs Demo'),
          ),
          body: TabBarView(
            children: [
              Icon(Icons.account_box),
              Icon(Icons.camera),
              Icon(Icons.chat),
            ],
          ),
        ),
      ),
    );
  }
}

class OtherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Aperture Laboratories'),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.account_box),text: "Profile",),
                Tab(icon: Icon(Icons.camera),text: "Science",),
                Tab(icon: Icon(Icons.supervised_user_circle), text: "Create new User",),
              ],
            ),
          ),

          body: new TabBarView(
            children:<Widget>[ // Each child is the content for each of the 3 tabs.
              new MenuTab1(),
              new MenuTab2(),
              new MenuTab3(),
            ],
          )),

        );
  }
}

class MenuTab1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Tab 1 Layout (Profile)"),
          new Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: new FlatButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
              color: Colors.red,
              textColor: Colors.white,
              icon: const Icon(Icons.hotel, size: 18.0),
              label: const Text('Log out'),
            ),
          ),
        ],
      ),
    );
  }
}

class MenuTab2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Tab 2 Layout (Science)"),
          new Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: new FlatButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              color: Colors.red,
              textColor: Colors.white,
              icon: const Icon(Icons.navigate_next, size: 18.0),
              label: const Text('Go To Details'),
            ),
          ),
        ],
      ),
    );
  }
}
//TODO : Add validation to form in MenuTab3. Also clean that shit up
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
      body: new Stack(
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
    );
  }
}


/*
Below is the original OtherScreen class (Coded by Tobias):

class OtherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Other Screen'),
      ),
      body: Center(
        child: RaisedButton(
            color: Colors.red,
            child: Text('Go back'),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
    );
  }
} */