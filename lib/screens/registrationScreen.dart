import 'package:flutter/material.dart';
import 'package:recipify/components/paintObjects.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:recipify/constants.dart';
import 'package:recipify/components/inputFields.dart';
import 'package:recipify/components/buttons.dart';
import 'package:provider/provider.dart';
import 'package:recipify/provider/userProvider.dart';

class RegistrationScreen extends StatelessWidget {
  final _auth = FirebaseAuth.instance;

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
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Container(
                  height: 300,
                  width: 300,
                  alignment: Alignment.center,
                  decoration: kLoginCardDecoration,
                  child: Column(
                    
                    children: <Widget>[
                      SizedBox(height: 25),
                      Text(
                        'Create Account',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w800),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: kTextFieldPadding,
                        child: Email(
                          onChanged: (email) => userData.updateEmail(email),
                        ),
                      ),
                      Padding(
                        padding: kTextFieldPadding,
                        child: Password(
                          onChanged: (password) =>
                              userData.updatePassword(password),
                        ),
                      ),SizedBox(height: 15),
                      Hero(
                        tag: 'login',
                        child: SlimButton(
                          label: 'Register Now',
                          onTap: () async {
                            print(userData.email);
                            print(userData.password);
                            try {
                              final loggedinUser =
                                  await _auth.createUserWithEmailAndPassword(
                                      email: userData.email,
                                      password: userData.password);
                              if (loggedinUser != null) {
                                Navigator.pushNamed(context, 'HomeScreen');
                              }
                            } catch (e) {}
                          },
                          color: Colors.orange,
                          textColor: Colors.white,
                        ),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Already have an account?'),
                            SizedBox(width: 10),
                            GestureDetector(
                                onTap: () => (Navigator.pushNamed(
                                    context, 'LoginScreen')),
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      color: Colors.deepOrange,
                                      decoration: TextDecoration.underline),
                                ))
                          ])
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
