import 'package:flutter/material.dart';

class Textyonu extends StatelessWidget {
  final String text;
  Textyonu({this.text});
  @override
  Widget build(BuildContext context) {
    return Transform.rotate (
      angle:-1.58,
      child: Text(
          text,style: TextStyle(fontFamily: 'Montserrat',fontSize: 20),
      ),
    );
  }
}