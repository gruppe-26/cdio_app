import 'package:flutter/material.dart';

//next level
import 'Menutab1(Profile).dart';
import 'menutab2(science).dart';
import 'menutab3(createuser).dart';

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
              new MyCustomForm(),
            ],
          )),

        );
  }
}




//TODO : Add validation to form in MenuTab3. Also clean that shit up



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