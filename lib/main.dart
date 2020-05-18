import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:recipify/screens/cameraScreen.dart';
import 'package:recipify/screens/loginScreen.dart';
import 'package:recipify/screens/landingScreen.dart';
import 'package:recipify/screens/registrationScreen.dart';
import 'package:recipify/screens/nativeCamera.dart';
import 'package:recipify/screens/homeScreen.dart';
import 'package:provider/provider.dart';
import 'package:recipify/provider/userProvider.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final cameras=await availableCameras();
  final firstCamera=cameras.first;
  runApp(
    ChangeNotifierProvider(
      create:(context) =>UserData(),
          child: MaterialApp(
        initialRoute: 'NativeCamera',
        routes:{
          'CameraScreen':(context)=>CameraScreen(),
          'HomeScreen':(context)=>HomeScreen(),
          'LandingScreen':(context)=>LandingScreen(),
          'LoginScreen':(context)=>LoginScreen(),
          'RegistrationScreen':(context)=>RegistrationScreen(),
          'NativeCamera':(context)=>Camera(camera:firstCamera)
        }
      ),
    ),
  );
}

