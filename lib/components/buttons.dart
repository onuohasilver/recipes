import 'package:flutter/material.dart';

class SlimButton extends StatelessWidget {
  SlimButton({this.onTap, this.label,this.color,this.textColor});
  final String label;
  final Function onTap;
  final Color color;
  final Color textColor;

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
                  TextStyle(color: this.textColor, fontWeight: FontWeight.w600),
            ),
          ),
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color:color),
    );
  }
}

class SlimButtonIcon extends StatelessWidget {
  SlimButtonIcon({this.onTap, this.color,this.icon});
  final Function onTap;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(34, 10, 34, 10),
            child: Icon(icon,color: Colors.white,)
          ),
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color:color),
    );
  }
}
