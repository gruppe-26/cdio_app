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
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.account_box),text: "Profile",),
                Tab(icon: Icon(Icons.camera),text: "Science",),
                Tab(icon: Icon(Icons.accessible), text: "Create new User",),
              ],
            ),
            title: Text('Aperture Laboratories'),
          ),

          body: TabBarView(
            children:[ // Each child is the content for each of the 3 tabs.
            Container(
              child: Center(
                child: Text('Tab 1 Layout (Profile)'),
              ),
            ),

              Container(
                child: Center(
                  child: Text('Tab 2 Layout (Science)'),
                ),
              ),

              Container(
                child: Center(
                  child: Text('Tab 3 Layout (Create User Form)'),
                ),
              )
            ],

          ),
        ),
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