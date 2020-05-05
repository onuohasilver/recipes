import 'package:flutter/material.dart';
import 'package:recipify/components/paintObjects.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:recipify/constants.dart';
import 'package:recipify/components/inputFields.dart';
import 'package:recipify/components/buttons.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserData>(context);
    return Scaffold(
      
        body: Container(
          
    decoration: kLoginImageDecoration,
    child: CustomPaint(
      painter: CurvePainter(),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Hero(
      tag: 'logo',
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/plate.png'),
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
            ),
            // SizedBox(height: 30),
            Text(userData.email),
            Padding(
      padding: const EdgeInsets.all(24.0),
      child: Container(
        height: 300,
        width: 300,
        alignment: Alignment.center,
        decoration: kLoginCardDecoration,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 15,
            ),
            Text(
              'Hello',
              style: TextStyle(
                  fontSize: 32, fontWeight: FontWeight.w800),
            ),
            Text(
              'Sign into Your Account',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 20),
            Padding(
              padding:
                  const EdgeInsets.fromLTRB(18.0, 3.0, 18.0, 3.0),
              child: Email(
                onChanged: (email)=>userData.updateEmail(email),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.fromLTRB(18.0, 3.0, 18.0, 3.0),
              child: Password(
                onChanged: (password) {
                  userData.updatePassword(password);
                },
              ),
            ),
            Hero(
              tag: 'login',
              child: SlimButton(
                label: 'Login',
                onTap: () {},
                color: Colors.orange,
                textColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
            )
          ],
        ),
    ),
        ),
      );
  }
}

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
