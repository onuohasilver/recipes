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
              Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/plate.png'),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              SizedBox(height: 130),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SlimButton(onTap: () {}, label: 'Login'),
                  SlimButton(onTap: () {}, label: 'Register'),
                ],
              ),
              SizedBox(height: 20),
              TypewriterAnimatedTextKit(
                speed:Duration(milliseconds:200),
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
