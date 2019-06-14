import 'package:flutter/material.dart';

import 'loginpagestate.dart';
import 'loginpage.dart';

class ProfilTab extends StatefulWidget {
  // Using statefulwidget because we will use animations
  @override
  State createState() => new ProfileTabst();
}

class ProfileTabst extends State<ProfilTab>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Stack(
      children: <Widget>[
        ClipPath(
            child: Container(
              color: Colors.blue.withOpacity(0.8),
            ),
            clipper: getClipper()),
        Positioned(
            width: 350,
            left: 25,
            top: MediaQuery.of(context).size.height / 5,
            child: Column(
              children: <Widget>[

                //profilbillede
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      image: DecorationImage(
                          image: AssetImage("assets/default-user-image.png"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.all(Radius.circular(75))),
                ),

                SizedBox(height: 20.0),

                //brugernavn og rolle
                Text(
                  'brugernavn',
                  style: TextStyle(
                    fontSize: 23.0,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'rolle',
                  style: TextStyle(
                    fontSize: 13.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),

                SizedBox(
                  height: 40.0,
                ),

                //knapper om at ændre kode og logud
                Container(
                  height: 30,
                  width: 95,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Colors.blueAccent,
                    color: Colors.blue,
                    elevation:3.0,
                    child: GestureDetector(
                      onTap: () {},
                      child: Center(
                        child: Text(
                          'password',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Container(
                  height: 30,
                  width: 95,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Colors.redAccent,
                    color: Colors.red,
                    elevation: 3.2,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'home');
                      },
                      child: Center(
                        child: Text(
                          'logout',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ))
      ],
    );
  }
}

class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height / 1.9);
    path.lineTo(size.width + 125, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
