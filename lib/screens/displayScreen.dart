import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';

class DisplayScreen extends StatelessWidget {
  final String imagePath;
  final bool gallery;
  final pickedImage;
  DisplayScreen({this.imagePath, this.gallery, this.pickedImage});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        
        body: gallery
            ? Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: FileImage(pickedImage), fit: BoxFit.cover)),
                  ),
                  Text('aaaaaaaaaaaaa')
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: height * .4,
                      width: double.infinity,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.file(File(imagePath),
                              fit: BoxFit.fitWidth)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'TOP MATCH',
                      style: GoogleFonts.squadaOne(fontSize: 40,color: Colors.deepOrange),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    height: height*.25,
                    child: Card(elevation: 4,),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'SIMILAR',
                      style: GoogleFonts.squadaOne(fontSize: 40,color: Colors.deepOrange),
                      textAlign: TextAlign.left,
                    ),
                  ),

                ],
              ),
      ),
    );
  }
}
