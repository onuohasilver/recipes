import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:recipify/screens/nativeCamera.dart';
import 'package:provider/provider.dart';
import 'package:recipify/provider/userProvider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserData(),
      child: MaterialApp(initialRoute: 'NativeCamera', routes: {
        'NativeCamera': (context) => Camera(camera: firstCamera)
      }),
    ),
  );
}
