import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'dart:io';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  File pickedImage;
  bool picked = false;
  Future<void> pickImage() async {
    var tempStore = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      pickedImage = tempStore;
      picked = true;
      print('tapped');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[          
          picked
              ? Container(
                height:600,
                width:400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: FileImage(pickedImage), fit: BoxFit.cover)),
                )
              : Container(
                  color: Colors.red,
                  child: Text('Teas'),
                ),
          RaisedButton(
            onPressed: pickImage,
            child: Text('Capture'),
          ),
        ],
      ),
    ));
  }
}
