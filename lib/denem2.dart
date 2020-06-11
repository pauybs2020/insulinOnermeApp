import 'package:flutter/material.dart';
import 'package:glucolives/deneme/card_widget.dart';


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      primary: true,
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFFF1F7FB)
        ),
        child: Center(
          child: PageView(
            pageSnapping: false,
            controller: PageController(
              viewportFraction: 0.6
            ),
            children: <Widget>[
              CardWidget('Sabah','assets/images/sabah.png'),
              CardWidget('Öğle','assets/images/ogle.png'),
              CardWidget('Akşam','assets/images/aksam.png'),
              CardWidget('Gece','assets/images/gece.png'),
            ],
          ),
        ),
      ),
      
      
      
    );

  }


}