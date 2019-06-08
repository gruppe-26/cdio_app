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
              icon: const Icon(Icons.navigate_next, size: 18.0),
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

class MenuTab3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Tab 3 Layout (Create User Form)"),
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