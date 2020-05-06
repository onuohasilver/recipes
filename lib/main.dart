import 'package:flutter/material.dart';
import 'package:recipify/screens/cameraScreen.dart';
import 'package:recipify/screens/loginScreen.dart';
import 'package:recipify/screens/landingScreen.dart';
import 'package:recipify/screens/registrationScreen.dart';
import 'package:recipify/screens/homeScreen.dart';
import 'package:provider/provider.dart';
import 'package:recipify/provider/userProvider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create:(context) =>UserData(),
          child: MaterialApp(
        initialRoute: 'LandingScreen',
        routes:{
          'CameraScreen':(context)=>CameraScreen(),
          'HomeScreen':(context)=>HomeScreen(),
          'LandingScreen':(context)=>LandingScreen(),
          'LoginScreen':(context)=>LoginScreen(),
          'RegistrationScreen':(context)=>RegistrationScreen()
        }
      ),
    ),
  );
}
