import 'package:flutter/material.dart';

final kLoginImageDecoration = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    colors: [Color(0xFFB737), Colors.orange[50]]
  ),
);

final kLoginCardDecoration=BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 18.0),
                    ],
                  );