import 'package:flutter/material.dart';
import 'package:glucolives/denem2.dart';

import 'package:glucolives/food.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:glucolives/gunluk_kan_seker.dart';
import 'package:glucolives/menu.dart';


class BottomNavBar extends StatefulWidget {

  final FirebaseUser user;

  BottomNavBar({Key key,this.user}):super(key:key);


  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  
  int _page = 1;
  GlobalKey _bottomNavigationKey = GlobalKey();
  //final LoginPage _loginPage=LoginPage();
  //final SignUpPage _signUpPage=SignUpPage();
  final MyHomePage _myHomePage=MyHomePage();
  final FoodChoose _foodChoose=FoodChoose();
  final  HomeScreen _homeScreen=HomeScreen();
    final  GunlukKanSekeri _gunlukKanSekeri=GunlukKanSekeri();

  //final Menu _menu=Menu();
  Widget _showPage =new MyHomePage(); 

  Widget _pageChooser(int page){
    switch(page){
      case 0:
      return _gunlukKanSekeri ;
      break;
      case 1:
      return _myHomePage;
      case 2:
      return _homeScreen;
      default:
      return new Container(
       child: new Center(
         child: new Text(
           'Page Not Found'

         ),
       )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: _page,
          height: 50.0,
          items: <Widget>[
            Icon(Icons.add, size: 30,color: Colors.black,),
            Icon(Icons.list, size: 30,color: Colors.black,),
            
            Icon(Icons.perm_identity, size: 30),
          ],
          color: Colors.green,
          buttonBackgroundColor: Colors.white60,
          backgroundColor: Colors.white,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (int tappedIndex) {
            setState(() {
              _showPage = _pageChooser(tappedIndex);
            });
          },
        ),
        body: Container(
          color: Colors.white,
          child: Center(
            child: _showPage,
          ),
        ));
  }
}