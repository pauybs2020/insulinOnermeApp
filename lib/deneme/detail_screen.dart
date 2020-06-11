import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:glucolives/Animation/FadeAnimation.dart';
import 'package:glucolives/LoginSignUp_Page/provider_widget.dart';
import 'package:glucolives/Responsive/SizeConfig.dart';
import 'package:glucolives/deneme/circular_clipper.dart';
import 'package:glucolives/food.dart';
import 'dart:math';
import 'package:intl/intl.dart';

final db = Firestore.instance;

class DetailScreenn extends StatefulWidget {
  final String imageUrl;
  final String texto;
  final String textoo;

  DetailsClassWhichYouWantToPop detailsClass;

  DetailScreenn({this.texto, this.imageUrl, this.detailsClass, this.textoo});

  @override
  _DetailScreennState createState() => _DetailScreennState();
}

class _DetailScreennState extends State<DetailScreenn> {
  final db = Firestore.instance;
  final formKey = GlobalKey<FormState>();

  TextEditingController _idf = TextEditingController();
  TextEditingController _karbonhidratKurali = TextEditingController();
  TextEditingController _insulin = TextEditingController();
  TextEditingController _idealkansekeri = TextEditingController();

  TextEditingController idfkurali = new TextEditingController();
  TextEditingController insulinmiktari = new TextEditingController();
  TextEditingController karbonhidratmiktari = new TextEditingController();
  TextEditingController gunlukseker = new TextEditingController();

  TextEditingController uygulananinsulinMiktari = new TextEditingController();

  void sabitDegerleriGetir() async {
    final uid = await Provider.of(context).auth.getCurrentUID();
    db.collection("Users").document(uid).get().then((value) {
      _idf.text = value["İdfKurali"];
      _karbonhidratKurali.text = value["KarbonhidratKurali"];
      _insulin.text = value["İnsulinMiktari"];
      _idealkansekeri.text = value["İdealkansekeri"];

      setState(() {});
    });
  }

  void hesapla() {
    double idfkural = double.parse(_idf.text);
    double insulinmiktari = double.parse(_insulin.text);
    double karbonhidratkurali = double.parse(_karbonhidratKurali.text);
    double idealkansekeri = double.parse(_idealkansekeri.text);
    double gunlukkansekeri = double.parse(gunlukseker.text);
    double karbonhidratmiktarii = double.parse(karbonhidratmiktari.text);
    print(idfkural.toString());
    print(insulinmiktari.toString());
    print(karbonhidratkurali.toString());
    print(idealkansekeri.toString());

    double idfhesapla = idfkural / insulinmiktari;
    print(idfhesapla.toString());

    double karbonhidrathesapla = karbonhidratkurali / insulinmiktari;
    print(karbonhidrathesapla.toString());

    double kanduzeltici = (gunlukkansekeri - idealkansekeri) / idfhesapla;
    print(kanduzeltici.toString());
    double karbonduzeltici = karbonhidratmiktarii / karbonhidrathesapla;
    print(karbonduzeltici.toString());

    double uygulananinsulinmiktari = kanduzeltici + karbonduzeltici;
    print(uygulananinsulinmiktari.toString());
    uygulananinsulinMiktari.text = uygulananinsulinmiktari.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color(0XFFEFF3F6),
      body: _crearCuerpo(context),
    );
  }

  Widget _crearCuerpo(context) {
    sabitDegerleriGetir();
    return ListView(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              transform: Matrix4.translationValues(0.0, -50.0, 0.0),
              child: Hero(
                tag: widget.texto,
                child: ClipShadowPath(
                  clipper: CircularClipper(),
                  shadow: Shadow(blurRadius: 20.0),
                  child: Image(
                    height: SizeConfig.safeBlockVertical * 45,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    image: AssetImage(widget.imageUrl),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  padding:
                      EdgeInsets.only(left: SizeConfig.safeBlockVertical * 1),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                  iconSize: 20.0,
                  color: Colors.black,
                ),
              ],
            ),
            //Resmin Alttındaki Yuvarlak Kısım(RawMeterialButton O işe yarıyor)
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: RawMaterialButton(
                  padding: EdgeInsets.all(10.0),
                  onPressed: () => print('Play Video'),
                  shape: CircleBorder(),
                  fillColor: Colors.white,
                  child: Image.asset(
                    "assets/images/insulin.png",
                    width: SizeConfig.safeBlockHorizontal * 8,
                    height: SizeConfig.safeBlockVertical * 8,
                  ),
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.safeBlockHorizontal * 1,
              vertical: SizeConfig.safeBlockVertical * 1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                widget.texto.toUpperCase(),
                style: TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * 5,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.safeBlockHorizontal * 3,
              vertical: SizeConfig.safeBlockVertical * 1),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0XFFEFF3F6),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.1),
                      offset: Offset(10, 2),
                      blurRadius: 10.0,
                      spreadRadius: 3.0),
                  BoxShadow(
                      color: Color.fromRGBO(255, 255, 255, 0.9),
                      offset: Offset(-10, -2),
                      blurRadius: 6.0,
                      spreadRadius: 3.0),
                ]),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Günlük Kan Sekerinizi Giriniz",
                    style: TextStyle(
                        fontFamily: "Quicksand", fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0XFFEFF3F6),
                        borderRadius: BorderRadius.circular(80.0),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.1),
                              offset: Offset(6, 2),
                              blurRadius: 6.0,
                              spreadRadius: 3.0),
                          BoxShadow(
                              color: Color.fromRGBO(255, 255, 255, 0.9),
                              offset: Offset(-6, -2),
                              blurRadius: 6.0,
                              spreadRadius: 3.0)
                        ]),
                    child: TextField(
                      controller: gunlukseker,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "Quicksand", fontWeight: FontWeight.w700),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Karbonhidrat Miktarınız",
                    style: TextStyle(
                        fontFamily: "Quicksand", fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0XFFEFF3F6),
                        borderRadius: BorderRadius.circular(80.0),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.1),
                              offset: Offset(6, 2),
                              blurRadius: 6.0,
                              spreadRadius: 3.0),
                          BoxShadow(
                              color: Color.fromRGBO(255, 255, 255, 0.9),
                              offset: Offset(-6, -2),
                              blurRadius: 6.0,
                              spreadRadius: 3.0)
                        ]),
                    child: TextField(
                      controller: karbonhidratmiktari,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "Quicksand", fontWeight: FontWeight.w700),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () async {
                      final result = await Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new FoodChoose(
                                  ad: widget.texto,
                                )),
                      );
                      setState(() {
                        karbonhidratmiktari.text = result.toString();
                      });
                    },
                    child: Container(
                      width: 350,
                      decoration: BoxDecoration(
                          color: Color(0XFFEFF3F6),
                          borderRadius: BorderRadius.circular(70.0),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.1),
                                offset: Offset(6, 2),
                                blurRadius: 6.0,
                                spreadRadius: 3.0),
                            BoxShadow(
                                color: Color.fromRGBO(255, 255, 255, 0.9),
                                offset: Offset(-6, -2),
                                blurRadius: 6.0,
                                spreadRadius: 3.0)
                          ]),
                      child: Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 0.0),
                              child: Container(
                                height: 55,
                                width: 55,
                                decoration: BoxDecoration(
                                    color: Color(0XFFEFF3F6),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.0)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color.fromRGBO(0, 0, 0, 0.1),
                                          offset: Offset(6, 2),
                                          blurRadius: 6.0,
                                          spreadRadius: 3.0),
                                      BoxShadow(
                                          color: Color.fromRGBO(
                                              255, 255, 255, 0.9),
                                          offset: Offset(-6, -2),
                                          blurRadius: 6.0,
                                          spreadRadius: 3.0)
                                    ]),
                                child: Icon(
                                  FontAwesomeIcons.shoppingBasket,
                                  size: 30.0,
                                  color: Colors.lightBlue,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 40.0,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Besinlerinizi Seçin",
                                  style: TextStyle(
                                      fontFamily: "Quicksand",
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15.0),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      hesapla();
                      showDialog(
                        context: context,
                        builder: (context) => CustomDialog(
                          title: widget.texto,
                          description: "Vurmanız Gereken insülin Miktari",
                          buttonText: "Tamam",
                          insulinMiktari: uygulananinsulinMiktari.text,
                          gunlukkansekeri: gunlukseker.text.toString(),
                          karbonhidratmiktari: karbonhidratmiktari.text,
                        ),
                      );
                    },
                    child: Container(
                      width: 350,
                      decoration: BoxDecoration(
                          color: Color(0XFFEFF3F6),
                          borderRadius: BorderRadius.circular(70.0),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.1),
                                offset: Offset(6, 2),
                                blurRadius: 6.0,
                                spreadRadius: 3.0),
                            BoxShadow(
                                color: Color.fromRGBO(255, 255, 255, 0.9),
                                offset: Offset(-6, -2),
                                blurRadius: 6.0,
                                spreadRadius: 3.0)
                          ]),
                      child: Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 0.0),
                              child: Container(
                                height: 55,
                                width: 55,
                                decoration: BoxDecoration(
                                    color: Color(0XFFEFF3F6),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.0)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color.fromRGBO(0, 0, 0, 0.1),
                                          offset: Offset(6, 2),
                                          blurRadius: 6.0,
                                          spreadRadius: 3.0),
                                      BoxShadow(
                                          color: Color.fromRGBO(
                                              255, 255, 255, 0.9),
                                          offset: Offset(-6, -2),
                                          blurRadius: 6.0,
                                          spreadRadius: 3.0)
                                    ]),
                                child: Icon(
                                  FontAwesomeIcons.calculator,
                                  size: 30.0,
                                  color: Colors.lightBlue,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 40.0,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "İnsulin Miktarını Hesapla",
                                  style: TextStyle(
                                      fontFamily: "Quicksand",
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15.0),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

BoxDecoration nMbtn = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.grey.shade100,
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.075),
        offset: Offset(2, 2),
        blurRadius: 2,
      )
    ]);

class CustomDialog extends StatelessWidget {
  final String title, description, buttonText;
  final Image image;
  final String insulinMiktari;
  final String gunlukkansekeri;
  final String karbonhidratmiktari;
  CustomDialog(
      {this.title,
      this.description,
      this.insulinMiktari,
      this.buttonText,
      this.image,
      this.gunlukkansekeri,
      this.karbonhidratmiktari});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 100, bottom: 16, left: 16, right: 16),
          margin: EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(17),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 10.0),
                )
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(title,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Quicksand",
                  )),
              SizedBox(height: 16.0),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  insulinMiktari,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: "Quicksand",
                  ),
                ),
              ),
              SizedBox(height: 24.0),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  description,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: "Quicksand",
                  ),
                ),
              ),
              SizedBox(height: 24.0),
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                  onPressed: () async {
                    var now = new DateTime.now();
                    var formatter = new DateFormat('yyyy-MM-dd');
                    String formatted = formatter.format(now);

                    final uid = await Provider.of(context).auth.getCurrentUID();
                    await db.collection("Users").document(uid).setData({
                      "${formatted.toString()}": {
                        "${title.toString()}GunlukKanSekeri":
                            gunlukkansekeri.toString(),
                        "${title.toString()}KarbonHidratMiktari":
                            karbonhidratmiktari.toString(),
                        "${title.toString()}İnsulinMiktari":
                            insulinMiktari.toString(),
                      }
                    }, merge: true).then((_) {
                      Navigator.pop(context);
                      print("success!");
                    });
                  },
                  child: Text("TAMAM"),
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: 0,
          left: 16,
          right: 16,
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/basarili-min.gif'),
            radius: 50,
          ),
        )
      ],
    );
  }
}
