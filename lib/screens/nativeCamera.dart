import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io';

class Camera extends StatefulWidget {
  Camera({this.camera});
  final CameraDescription camera;
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  CameraController controller;
  Future<void> controllerFuture;
  void initState() {
    super.initState();
    controller = CameraController(widget.camera, ResolutionPreset.high);
    controllerFuture = controller.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          child: FutureBuilder<void>(
              future: controllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  print('connected');
                  return CameraPreview(controller);
                } else {
                  print('not connected');
                  return Center(child: CircularProgressIndicator());
                }
              }),
        ),
        Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
                            height: 150,
                            width: 150,
                            child: Material(
                             
                              shape: CircleBorder(),
                              color: Colors.orangeAccent,
                              elevation: 10,
                            ),
                          ),
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                height: 100,
                                width: 100,
                                child: RaisedButton(
                                    onPressed: () async {
                                      try {
                                        await controllerFuture;
                                        final path = join(
                                            (await getTemporaryDirectory())
                                                .path,
                                            '${DateTime.now()}');
                                        await controller.takePicture(path);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                DisplayScreen(
                                                    imagePath: path),
                                          ),
                                        );
                                      } catch (e) {}
                                    },
                                    child: Icon(
                                      Icons.camera_alt,
                                      color: Colors.orangeAccent,
                                    ),
                                    shape: CircleBorder(),
                                    elevation: 10,
                                    color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  )),
            ),
            top: 30)
      ],
    ));
  }
}

class DisplayScreen extends StatelessWidget {
  final String imagePath;
  DisplayScreen({this.imagePath});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.file(
        File(imagePath),
      ),
    );
  }
}
