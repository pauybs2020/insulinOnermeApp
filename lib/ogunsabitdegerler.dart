


import 'package:flutter/material.dart';


class GunSabitDegerler extends StatefulWidget {

  final heroTag;
  GunSabitDegerler({this.heroTag});
  @override
  _GunSabitDegerlerState createState() => _GunSabitDegerlerState();
}

class _GunSabitDegerlerState extends State<GunSabitDegerler> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child:Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 600,
              child:Hero(
                tag: widget.heroTag,
                   child: Stack(
                  children: <Widget>[
                    Image.asset(widget.heroTag,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    ),
                    

                  ],
                ),
              ),
            )
          ],
        ),

      ),
    );
  }
}

