import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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

  File pickedImage;
  bool picked = false;
  Future<void> pickImage() async {
    var tempStore = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      pickedImage = tempStore;
      picked = true;
      print('tapped');
    });
  }

  void initState() {
    super.initState();
    controller = CameraController(widget.camera, ResolutionPreset.high);
    controllerFuture = controller.initialize();
  }
   @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    controller.dispose();
    super.dispose();
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
                  decoration: BoxDecoration(color: Colors.orange[50]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.grey, blurRadius: 5.0)
                            ]),
                        child: IconButton(
                            icon: Icon(Icons.refresh),
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, 'HomeScreen');
                            }),
                      ),
                      Stack(
                        children: <Widget>[
                          Container(
                            height: 150,
                            width: 150,
                            child: Material(
                              shape: CircleBorder(),
                              color: Colors.orangeAccent,
                              elevation: 20,
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
                                            builder: (context) => DisplayScreen(
                                              imagePath: path,
                                              gallery: false,
                                              pickedImage: pickedImage,
                                            ),
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
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.grey, blurRadius: 5.0)
                            ]),
                        child: IconButton(
                            icon: Icon(Icons.photo_size_select_actual),
                            onPressed: () async {
                              await pickImage();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DisplayScreen(
                                    gallery: picked,
                                    pickedImage: pickedImage,
                                  ),
                                ),
                              );
                            }),
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
  final bool gallery;
  final File pickedImage;
  DisplayScreen({this.imagePath, this.gallery, this.pickedImage});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: gallery
            ? Container(
                height: 600,
                width: 400,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: FileImage(pickedImage), fit: BoxFit.cover)),
              )
            : Image.file(File(imagePath)));
  }
}
