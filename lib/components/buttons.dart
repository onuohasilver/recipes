import 'package:flutter/material.dart';

class SlimButton extends StatelessWidget {
  SlimButton({this.onTap, this.label});
  final String label;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(34, 10, 34, 10),
            child: Text(
              label,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            ),
          ),
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: Colors.white),
    );
  }
}
