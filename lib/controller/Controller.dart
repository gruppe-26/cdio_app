import 'dart:async';
import 'package:cdio_app/backend/user.dart';
import 'package:cdio_app/backend/BackendDAO.dart';

BackendDAO dao = new BackendDAO();

class Controller {
  // Constructor
  Controller();

  String _synligtOrd;
  String _ordet;

  // methods
  Future<bool> logIn(User loginUser) async{
    bool login = await dao.checkLogin(loginUser); // Receive user from server
    return login;
  }

  Future<String> start() async{
    this._synligtOrd = await dao.startSpil();

    return _synligtOrd;
  }

  String getSynligtOrd(){
    return _synligtOrd;
  }

  Future<String> guessWord(String guess)async{
    this._synligtOrd = await dao.guessOrd(guess);

    return _synligtOrd;
  }

  Future<String> getOrdet()async{
    this._ordet = await dao.getOrdet();
    return _ordet;
  }


}



