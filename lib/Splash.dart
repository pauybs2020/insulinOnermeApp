import 'package:flutter/material.dart';
import 'package:glucolives/Animation/FadeAnimation.dart';
import 'package:glucolives/Animation/fadeInFadeOutRoute.dart';
import 'dart:async';

import 'package:glucolives/main.dart';


class Splash extends StatefulWidget {
  Splash({Key key}) : super(key: key);
  @override
  _State createState() => new _State();
}

class _State extends State<Splash> {
  Duration duration = const Duration(seconds: 5);

  startTimeout() {
    return new Timer(duration, handleTimeout);
  }

  void handleTimeout() {
    Navigator.pop(context);
    Navigator.push(
        context, FadeInFadeOutRoute(builder: (context) => new HomeController()));
  }

  initState() {
    super.initState();
    this.startTimeout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.white,
      body: Center(
        child: FadeAnimation(2.5,Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
           image: DecorationImage(
           image: AssetImage('assets/images/logo.png'),

              fit: BoxFit.contain
            ),
            color: Colors.white70,
            borderRadius: BorderRadius.all(Radius.circular(40)),
            boxShadow: [

              BoxShadow(
                color: Colors.green[800],
                offset: Offset(5.0,5.0),
                blurRadius: 15.0,
                spreadRadius: 1.0
              ),
              BoxShadow(
                color: Colors.green,
                offset: Offset(-6.0,-6.0),
                blurRadius: 15.0,
                spreadRadius: 1.0
              ),
              
            ]
          ),
        )),
      ),
    );
  }

  dispose() {
    super.dispose();
  }
}