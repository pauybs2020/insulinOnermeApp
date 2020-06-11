import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:glucolives/LoginSignUp_Page/provider_widget.dart';
import 'package:glucolives/Sabit_Degerler/sabit_deger_giris.dart';
import 'package:glucolives/Veriler/Veriler.dart';
import 'package:glucolives/food.dart';
import 'package:glucolives/gunluk_kan_seker.dart';
import 'package:glucolives/main.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;
  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final FirebaseUser user;

  MyHomePage({Key key, this.user}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return new Scaffold(
      appBar: new AppBar(
        title: Image.asset(
          'assets/images/logo.png',
          height: 100.0,
        ),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back),
            color: Colors.green),
        actions: <Widget>[
          IconButton(
            onPressed: () async {
              try {
                await Provider.of(context).auth.signOut();
                return new HomeController();
              } catch (e) {
                print("e");
              }
            },
            icon: Icon(FontAwesomeIcons.signOutAlt),
            color: Colors.green,
          )
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          SizedBox(height: 15),
          Container(
            alignment: Alignment(0.0, -0.40),
            height: 50.0,
            color: Colors.white,
            child: Text(
              "Menü ",
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 20.0),
            ),
          ),
          SizedBox(height: 10),
          GridView.count(
            crossAxisCount: 2,
            primary: false,
            crossAxisSpacing: 2.0,
            mainAxisSpacing: 4.0,
            shrinkWrap: true,
            children: <Widget>[
              _buildCard(
                  'Kan Şekerlerim', 'Açıklama', 1, 'assets/images/sugar.png'),
              _buildCard('Veriler', 'Açıklama', 2, 'assets/images/brain.png'),
              _buildCard(
                  'İstatistikler', 'Açıklama', 3, 'assets/images/grafik.png'),
              _buildCard('Besinler', 'Açıklama', 4, 'assets/images/food.png'),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildCard(
    String name,
    String status,
    int cardIndex,
    String img,
  ) {
    return InkWell(
      onTap: () {
        if (cardIndex == 2) {
          Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => new SabitDegerlerSayfasi()),
          );
        }
        if (cardIndex == 3) {
          Navigator.push(
            context,
            new MaterialPageRoute(builder: (context) => new Veriler()),
          );
        }
        if (cardIndex == 1) {
          Navigator.push(
            context,
            new MaterialPageRoute(builder: (context) => new GunlukKanSekeri()),
          );
        }
      },
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          elevation: 7.0,
          child: Column(
            children: <Widget>[
              SizedBox(height: 15.0),
              Stack(children: <Widget>[
                Container(
                  height: SizeConfig.blockSizeHorizontal * 20,
                  width: SizeConfig.blockSizeVertical * 10.6,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.0),
                      color: Colors.green,
                      image: DecorationImage(
                          image: AssetImage(img), fit: BoxFit.contain)),
                ),
              ]),
              SizedBox(height: 8.0),
              Text(
                name,
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
              ),
              SizedBox(height: 5.0),
              Text(
                status,
                style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                    color: Colors.grey),
              ),
              SizedBox(height: 15.0),
              Expanded(
                  child: Container(
                width: 175.0,
                decoration: BoxDecoration(
                  //color: status == 'Away' ? Colors.grey: Colors.green,
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0)),
                ),
                child: Center(
                  child: Text(
                    '',
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'Quicksand'),
                  ),
                ),
              ))
            ],
          ),
          margin: cardIndex.isEven
              ? EdgeInsets.fromLTRB(10.0, 0.0, 25.0, 10.0)
              : EdgeInsets.fromLTRB(25.0, 0.0, 5.0, 10.0)),
    );
  }
}

Widget arkaplan() {
  return Positioned(
    top: 50.0,
    left: 110.0,
    child: Transform.rotate(
      angle: 15.0,
      child: Container(
        height: 250.0,
        width: 250.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60.0),
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Color.fromRGBO(32, 226, 111, .1),
                  Color.fromRGBO(129, 251, 184, 1)
                ])),
      ),
    ),
  );
}
