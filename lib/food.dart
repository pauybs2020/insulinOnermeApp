import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:glucolives/Animation/FadeAnimation.dart';

double gelendeger;
double toplam = 0;
double besingram;
String resimyolu;
String besinadi;
String adi;

class MyAppp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FoodChoose(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DetailsClassWhichYouWantToPop {
  final double ad;
  DetailsClassWhichYouWantToPop(this.ad);
}

class FoodChoose extends StatefulWidget {
  String ad;
  FoodChoose({this.ad});

  @override
  _FoodChooseState createState() => _FoodChooseState();
}

class _FoodChooseState extends State<FoodChoose> {
  @override
  Widget build(BuildContext context) {
    imageCache.clear();

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.green,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
            child: FadeAnimation(
                1,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    FadeAnimation(
                        1.2,
                        Container(
                            width: 125.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.home),
                                  color: Colors.white,
                                  onPressed: () {},
                                ),
                              ],
                            )))
                  ],
                )),
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: FadeAnimation(
                1.4,
                Row(
                  children: <Widget>[
                    Text("Besin",
                        style: TextStyle(
                            fontFamily: 'Quicksand',
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 25.0)),
                    SizedBox(width: 5.0),
                    Text('Seçiminiz',
                        style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontSize: 25.0))
                  ],
                )),
          ),
          SizedBox(height: 35.0),
          FadeAnimation(
              1.6,
              Container(
                height: MediaQuery.of(context).size.height - 185.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(75.0)),
                ),
                child: ListView(
                  primary: false,
                  padding: EdgeInsets.only(left: 25.0, right: 20.0),
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 45.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height - 300.0,
                        child: ListView(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            children: [
                              _besinler('assets/images/plate6.png',
                                  '  Izgara Et', '  0.1825'),
                              _besinler('assets/images/elma.png', '  Elma',
                                  '  0.1450'),
                              _besinler('assets/images/karpuz.png', '  Karpuz',
                                  '  0.0640'),
                              _besinler('assets/images/baklava.png',
                                  '  Baklava', '   0.1125'),
                              _besinler('assets/images/domatescorbasi.png',
                                  '  Domates Çorbası', '  0.0715'),
                              _besinler('assets/images/pilav.png', '  Pilav',
                                  '  0.2743'),
                              // _besinler('assets/images/kırmızımercimek.png','  Kırmızı  Mercimek Ç.','  0,1'),
                              _besinler('assets/images/tavukcorbasi.png',
                                  ' Tavuk Çorbasi', '  0.0720'),
                              //_besinler('assets/images/pilav.png',' Baklava','  0,1+98'),
                              _besinler('assets/images/makarna.png',
                                  ' Soslu Makarna', ' 0.1955'),
                              _besinler('assets/images/Kurufasulye.png',
                                  ' Kurufasulye', ' 0.1320'),
                              _besinler('assets/images/ekmek.png', '  Ekmek',
                                  '  0.4900'),
                              _besinler('assets/images/ekmek2.png',
                                  ' Çavdarlı Ekmek', ' 0.4800'),
                              _besinler('assets/images/tambugday.png',
                                  ' Tam Buğday Ekmek', '  0.4100'),
                            ]),
                      ),
                    ),
                    FadeAnimation(
                        1.8,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              height: 55.0,
                              width: 50.0,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey,
                                    style: BorderStyle.solid,
                                    width: 1.0),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                child: Icon(Icons.search, color: Colors.black),
                              ),
                            ),
                            Container(
                              height: 55.0,
                              width: 50.0,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey,
                                    style: BorderStyle.solid,
                                    width: 1.0),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                child: Icon(Icons.shopping_basket,
                                    color: Colors.black),
                              ),
                            ),
                            FadeAnimation(
                                2,
                                Container(
                                  height: 55.0,
                                  width: 90.0,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey,
                                        style: BorderStyle.solid,
                                        width: 1.0),
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Color(0xFF1C1428),
                                  ),
                                  child: Center(
                                    child: FlatButton(
                                      onPressed: () {
                                        adi = widget.ad.toString();
                                        print("deneme ${toplam.toString()}");
                                        showDialog(
                                            context: context,
                                            builder: (context) =>
                                                CustomDialog2());
                                      },
                                      child: Text(
                                        "Bitir",
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            color: Colors.white,
                                            fontSize: 15.0),
                                      ),
                                    ),
                                  ),
                                ))
                          ],
                        ))
                  ],
                ),
              ))
        ],
      ),
    );
  }

  Widget _besinler(
    String resimYolu,
    String besinAdi,
    String karbonhidratMiktari,
  ) {
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      child: InkWell(
        onTap: () {
          print("deneme" + toplam.toString());
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Hero(
                    tag: resimYolu,
                    child: Image(
                      image: AssetImage(resimYolu),
                      fit: BoxFit.cover,
                      height: 75.0,
                      width: 75.0,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(besinAdi,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold)),
                      Text(
                        karbonhidratMiktari,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 15.0,
                            color: Colors.grey),
                      )
                    ],
                  )
                ],
              ),
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.shoppingCart),
              color: Colors.green[500],
              onPressed: () {
                besingram = double.parse(karbonhidratMiktari.toString());
                resimyolu = resimYolu;
                besinadi = besinAdi;
                showDialog(
                    context: context, builder: (context) => CustomDialog());
              },
            )
          ],
        ),
      ),
    );
  }
}

class CustomDialog extends StatelessWidget {
  TextEditingController _gelendeger = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: dialogContent(context),
      ),
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
              SizedBox(height: 15.0),
              Text("Kaç Gram Tüketildi ?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 21.0,
                    fontFamily: "Quicksand",
                    fontWeight: FontWeight.w700,
                  )),
              SizedBox(height: 16.0),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: TextField(
                    controller: _gelendeger,
                    textAlign: TextAlign.center,
                  )),
              SizedBox(height: 24.0),
              Align(
                alignment: Alignment.bottomCenter,
                child: FlatButton(
                  onPressed: () async {
                    gelendeger = double.parse(_gelendeger.text);
                    double sonuc = gelendeger * besingram;
                    toplam += sonuc;
                    print(sonuc.toString());
                    print(toplam.toString());

                    Navigator.pop(context);
                  },
                  child: Text(
                    "OLUŞTUR",
                    style: TextStyle(
                        fontFamily: 'Quicksand', fontWeight: FontWeight.w700),
                  ),
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
            child: ClipOval(
              child: Image.asset(
                resimyolu,
                fit: BoxFit.contain,
              ),
            ),
            backgroundColor: Colors.white,
            // backgroundImage: AssetImage('assets/images/source.gif',),
            radius: 50,
          ),
        )
      ],
    );
  }
}

class CustomDialog2 extends StatelessWidget {
  TextEditingController _gelendeger = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: dialogContent(context),
      ),
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
              SizedBox(height: 20.0),
              Text("${adi.toString()}'ki Tükettiğiniz Karbonhidrat Miktarınız",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Quicksand",
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                  )),
              SizedBox(height: 16.0),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "${toplam.toString()}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "Quicksand",
                        fontSize: 30,
                        fontWeight: FontWeight.w700),
                  )),
              SizedBox(height: 24.0),
              Align(
                alignment: Alignment.bottomCenter,
                child: FlatButton(
                  onPressed: () async {
                    Navigator.pop(context, toplam.toString());
                    Navigator.pop(context, toplam.toString());
                    toplam = 0;
                  },
                  child: Text(
                    "TAMAMLA",
                    style: TextStyle(
                      fontSize: 15.00,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
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
            child: ClipOval(
              child: Image.asset("assets/images/besinsecimi.gif"),
            ),
            backgroundColor: Colors.white,
            // backgroundImage: AssetImage('assets/images/source.gif',),
            radius: 50,
          ),
        )
      ],
    );
  }
}
