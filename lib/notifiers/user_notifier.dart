import 'package:flutter/material.dart';

class UserNotifier extends ChangeNotifier {
  int _streak = 0;
  String username = "Dilan";
  String userLanguage = "Fuldé";

    String get name => username;
    String get language => userLanguage;


  void incrementStreak() {
    _streak++;
    notifyListeners();
  }

  void resetStreak() {
    _streak = 0;
    notifyListeners();
  }

  void setStreak(int value) {
    _streak = value;
    notifyListeners();
  }
  set name(String newName) {
    username = newName;
    notifyListeners();
  }

  set language(String newuserLanguage) {
    userLanguage = newuserLanguage;
    notifyListeners();
  }

}
