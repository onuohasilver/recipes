import 'package:flutter/material.dart';

class Email extends StatelessWidget {
  final Function onChanged;
  Email({this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.email,color:Colors.orange),
        labelText: 'Email ID:',
        labelStyle: TextStyle(fontSize: 14),
      ),
    );
  }
}

class Password extends StatelessWidget {
  final Function onChanged;
  Password({this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      obscureText: true,
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.vpn_key,color:Colors.orange),
        labelText: 'Password:',
        labelStyle: TextStyle(fontSize: 14),
      ),
    );
  }
}
