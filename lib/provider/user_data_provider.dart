import 'package:flutter/material.dart';

class UserDataProvider extends ChangeNotifier {
  var userData;

  String id;
  String firstName;
  String lastName;
  String email;

  setUserData(userData) {
    this.userData = userData;

    id = userData.id;
    firstName = userData.first_name;
    lastName = userData.last_name;
    email = userData.email;

    notifyListeners();
  }
}
