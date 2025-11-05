import 'package:flutter/material.dart';

/// Login view modelllerde
/// state yonetimini abstract class ile saglayabiliriz.
/// Cok daha rahat olacaktir.
/// 
/// 

/// Dev Tools'tan izlenir. provider sekmesinden
/// Bir sonraki sayyaya gecince eski provider'in memory'den gitmesi bekleniyor
/// Burda denedim oluyor.Loading state error state ve benzeri durumlarda gozukuyor hatta
/// Resimlerden de bak ekledim buraya


import '../bloc_state.dart';

class LoginViewModel extends ChangeNotifier {
  LoginState state = LoginInitial();

  Future<void> login(String username, String password) async {
    state = LoginLoading();
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));
    state = LoginSuccess();


    state = LoginSuccess();
    notifyListeners();
  }
}



