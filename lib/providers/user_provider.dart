import 'package:blott_app/core/models/user_model.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  User _user = User(firstName: '', lastName: '');

  User get user => _user;

  void setFirstName(String firstName) {
    _user.firstName = firstName;
    notifyListeners();
  }

  void setLastName(String lastName) {
    _user.lastName = lastName;
    notifyListeners();
  }
}
