import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class UserInfo extends ChangeNotifier{
  UserInfo(this.email,this.password);
  String password;
  String email;

  void updatePassword(passwordValue){
    password=passwordValue;
    notifyListeners();
  }

  void updateEmail(emailValue){
    email=emailValue;
    notifyListeners();
  }
}