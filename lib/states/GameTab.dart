import 'dart:io';

import 'package:async/async.dart';
import 'package:cdio_app/backend/BackendDAO.dart';
import 'package:flutter/material.dart';
import 'package:cdio_app/controller/Controller.dart';
import 'dart:async';

import 'package:flutter/widgets.dart';

Controller c = new Controller();
BackendDAO b = new BackendDAO();
class Game extends StatefulWidget {
  @override
  State createState() => new _GameTab();
}



class _GameTab extends State<Game> with SingleTickerProviderStateMixin {
  final AsyncMemoizer _memoizer = AsyncMemoizer();
  final _formKey = GlobalKey<FormState>();
  final _guess = TextEditingController();
  String g;
  String _tekst="Skriv Bogstavet her";
  String _synligtOrd;
  int countTouch = 0;
  @override
  void initState(){
    super.initState();
    _startGame();
  }

  _startGame() {
    setState(() {
      c.start();
      // TODO: Start game over REST
    });
  }

  @override
  Widget build(BuildContext context) {
    _synligtOrd = c.getSynligtOrd();
    return FutureBuilder(
      future: this.getWord(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {

        switch (snapshot.connectionState){
          case ConnectionState.none:
            //case ConnectionState.waiting:
          // return Center(child: CircularProgressIndicator());
          default:
            return Column(
              children: <Widget>[
                SizedBox(height: 120), // Creates spaces between the different layouts
                Container(child: Center(child: TextField(
                    keyboardType: TextInputType.text,
                    onChanged: (v)=>setState((){_tekst=v;}),
                    controller: _guess,
                    ),
                ))
                ,
                SizedBox(height: 100),
                SizedBox(height: 100),
                new MaterialButton(
                  minWidth: 200,
                  height: 50.0,
                  color: Colors.blueAccent,
                  textColor: Colors.white,
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                  child: new Text("Gæt",
                    style: new TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                      // TODO : Send bogstav til controller
                    setState(()async{
                      this._synligtOrd = await guessWord(_guess.text);
                    });
                      dispose();
                  },
                )
              ],
            );
        }
        });
  }

  Future<String> getWord() async{
    await Future.delayed(Duration(milliseconds: 400));
    String ord = c.getSynligtOrd();
    print("ORDET ER!! : "+ord);
    return ord;
  }



  guessWord(String guess){
    return this._memoizer.runOnce(() async {
      await c.guessWord(guess);
      print("guessing:::");
    });
  }
}
