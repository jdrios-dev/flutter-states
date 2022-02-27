import 'package:flutter/material.dart';
import 'package:singleton/models/user.dart';

class UserService with ChangeNotifier {
  User? _user;
  User get user => _user!;
  bool get existUser => (_user != null) ? true : false;

  set user(User user) {
    _user = user;
    notifyListeners();
  }

  void changeAge(int age) {
    _user!.age = age;
    notifyListeners();
  }

  void removeUser() {
    _user = null;
    notifyListeners();
  }

  void addPro() {
    _user!.professions.add('New Pro');
    notifyListeners();
  }
}
