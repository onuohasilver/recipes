import 'package:flutter/material.dart';
import 'package:recipify/components/buttons.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [Color(0xFFB737), Colors.orange],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 130),
              Hero(
                tag: 'logo',
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/plate.png'),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 130),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Hero(
                    tag: 'login',
                    child: SlimButton(
                      onTap: () => Navigator.pushNamed(context, 'LoginScreen'),
                      label: 'Login',
                      color: Colors.white,
                      textColor: Colors.black,
                    ),
                  ),
                  SlimButton(
                    onTap: () =>
                        Navigator.pushNamed(context, 'RegistrationScreen'),
                    label: 'Register',
                    color: Colors.white,
                    textColor: Colors.black,
                  ),
                ],
              ),
              SizedBox(height: 20),
              TypewriterAnimatedTextKit(
                totalRepeatCount: 6,
                speed: Duration(milliseconds: 150),
                text: ['Now! Quick Login and checkout foodie styles'],
                textStyle: TextStyle(color: Colors.white, fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
