import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserData extends ChangeNotifier {
  String email = 'asas';
  String password;
  updateEmail(newEmail) {
    email = newEmail;
    notifyListeners();
  }

  updatePassword(newPassword) {
    password = newPassword;
    notifyListeners();
  }
}
