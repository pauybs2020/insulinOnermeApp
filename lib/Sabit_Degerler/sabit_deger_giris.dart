import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glucolives/LoginSignUp_Page/provider_widget.dart';


  final db = Firestore.instance;

class SabitDegerlerSayfasi extends StatefulWidget {
  @override
  _SabitDegerlerSayfasiState createState() => _SabitDegerlerSayfasiState();
}

class _SabitDegerlerSayfasiState extends State<SabitDegerlerSayfasi> {

  int idf;
  TextEditingController _idf = TextEditingController();
  TextEditingController _karbonhidratKurali = TextEditingController();
  TextEditingController _insulin = TextEditingController();
  TextEditingController _idealkansekeri = TextEditingController();

  
    void sabitDegerleriGetir() async {
     final uid=await Provider.of(context).auth.getCurrentUID();
     db.collection("Users").document(uid).get().then((value){
          _idf.text=value["İdfKurali"];
          _karbonhidratKurali.text=value["KarbonhidratKurali"];
          _insulin.text=value["İnsulinMiktari"];
          _idealkansekeri.text=value["İdealkansekeri"];
          setState(() {
          });
     });
  }
 @override
  void initState() {
    // TODO: implement initState
    
    sabitDegerleriGetir();
  }
 
 
  @override
  Widget build(BuildContext context) {
    sabitDegerleriGetir();
    setState(() {
      
    });
    return Scaffold(
      appBar: buildAppBar(),
      resizeToAvoidBottomPadding: false,
      body: ListView(
        children: <Widget>[
          SizedBox(height: 5),
          Container(
            alignment: Alignment(0.0, -0.40),
            height: 50.0,
            color: Colors.white,
            child: Text(
              "SABİT DEĞERLERİM",
              style: TextStyle(fontFamily: 'Quicksand', fontSize: 20.0),
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                )),
            child: Wrap(
              runSpacing: 20,
              spacing: 20,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context, builder: (context) => CustomDialog());
                  },
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Container(
                        width: constraints.maxWidth / 2 - 10,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: LinearGradient(colors: [
                              Colors.blue,
                              Colors.blue.withOpacity(.7)
                            ])),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                      alignment: Alignment.center,
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          gradient: LinearGradient(colors: [
                                            Colors.blue,
                                            Colors.blue.withOpacity(.7)
                                          ])),
                                      child: Image.asset(
                                        "assets/images/insulin.png",
                                        width: 50,
                                        height: 50,
                                      )),
                                  SizedBox(width: 35),
                                ],
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: RichText(
                                      text: TextSpan(
                                          style: TextStyle(color: Colors.white),
                                          children: [
                                        TextSpan(
                                          
                                          text: "${_idf.text} \n",
                                          style: Theme.of(context)
                                              .textTheme
                                              .title
                                              .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                        ),
                                        TextSpan(
                                          text: "İnsülin Duyarlılık Faktörüm",
                                          style: TextStyle(
                                            fontFamily: "Quicksand",
                                            fontSize: 10,
                                            fontWeight: FontWeight.w700,
                                            height: 2,
                                          ),
                                        ),
                                      ])),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => CustomDialog2());
                  },
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Container(
                        width: constraints.maxWidth / 2 - 10,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: LinearGradient(colors: [
                              Colors.green,
                              Colors.green.withOpacity(.7)
                            ])),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                      alignment: Alignment.center,
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          gradient: LinearGradient(colors: [
                                            Colors.green,
                                            Colors.green.withOpacity(.7)
                                          ])),
                                      child: Image.asset(
                                        "assets/images/aa.png",
                                        width: 50,
                                        height: 50,
                                      )),
                                  SizedBox(width: 35),
                                ],
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: RichText(
                                      text: TextSpan(
                                          style: TextStyle(color: Colors.white),
                                          children: [
                                        TextSpan(
                                          text: "${_karbonhidratKurali.text} \n",
                                          style: Theme.of(context)
                                              .textTheme
                                              .title
                                              .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                        ),
                                        TextSpan(
                                          text: "Karbonhidrat Kuralım",
                                          style: TextStyle(
                                            fontFamily: "Quicksand",
                                            fontSize: 11,
                                            fontWeight: FontWeight.w700,
                                            height: 2,
                                          ),
                                        ),
                                      ])),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => CustomDialog3());
                  },
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Container(
                        width: constraints.maxWidth / 2 - 10,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: LinearGradient(colors: [
                              Colors.red,
                              Colors.red.withOpacity(.7)
                            ])),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                      alignment: Alignment.center,
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          gradient: LinearGradient(colors: [
                                            Colors.red,
                                            Colors.red.withOpacity(.7)
                                          ])),
                                      child: Image.asset(
                                        "assets/images/aaa.png",
                                        width: 50,
                                        height: 50,
                                      )),
                                  SizedBox(width: 35),
                                ],
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: RichText(
                                      text: TextSpan(
                                          style: TextStyle(color: Colors.white),
                                          children: [
                                        TextSpan(
                                          text: "${_insulin.text} \n",
                                          style: Theme.of(context)
                                              .textTheme
                                              .title
                                              .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                        ),
                                        TextSpan(
                                          text: "insülin Miktarım",
                                          style: TextStyle(
                                            fontSize: 11,
                                            fontFamily: "Quicksand",
                                            
                                            fontWeight: FontWeight.w700,
                                            height: 2,
                                          ),
                                        ),
                                      ])),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => CustomDialog4());
                  },
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Container(
                        width: constraints.maxWidth / 2 - 10,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: LinearGradient(colors: [
                              Colors.deepOrangeAccent,
                              Colors.deepOrangeAccent.withOpacity(.7)
                            ])),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                      alignment: Alignment.center,
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          gradient: LinearGradient(colors: [
                                            Colors.deepOrangeAccent,
                                            Colors.deepOrangeAccent
                                                .withOpacity(.7)
                                          ])),
                                      child: Image.asset(
                                        "assets/images/aaaa.png",
                                        width: 50,
                                        height: 50,
                                      )),
                                  SizedBox(width: 35),
                                ],
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: RichText(
                                      text: TextSpan(
                                          style: TextStyle(color: Colors.white),
                                          children: [
                                        TextSpan(
                                          text: "${_idealkansekeri.text} \n",
                                          style: Theme.of(context)
                                              .textTheme
                                              .title
                                              .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                        ),
                                        TextSpan(
                                          text: "İdeal Kan Şekerim",
                                          style: TextStyle(
                                            fontFamily: "Quicksand",
                                            fontSize: 11,
                                            fontWeight: FontWeight.w700,
                                            height: 2,
                                          ),
                                        ),
                                      ])),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
            child: Container(
              height: 150,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * .4,
                      top: 20,
                      right: 20,
                    ),
                    height: 130,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF60BE93),
                          Color(0xFF1B8D59),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: RichText(
                      text: TextSpan(
                          text:
                              "Hesaplamak için Yukarıda Gerekli Olan Değerleri Girmeniz Yeterlidir",style: TextStyle(
                                fontFamily: "Quicksand",
                                            fontWeight: FontWeight.w700,
                              )),
                    ),
                    
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: SvgPicture.asset("assets/icons/nurse.svg"),
                  )
                ],
              ),
            ),
          ),
          
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Image.asset(
        'assets/images/logo3.png',
        height: 100.0,
      ),
      elevation: 0.0,
      centerTitle: true,
      backgroundColor: Colors.white,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back), color: Colors.green),
      actions: <Widget>[
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.home),
          color: Colors.green,
        )
      ],
    );
  }
}

class CustomDialog extends StatelessWidget {


  TextEditingController _idf = TextEditingController();
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
              SizedBox(height: 16.0),
              Text("İnsulin Duyarlılık Faktörünüzü Giriniz",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                     fontFamily: "Quicksand"
                  ),
                   textAlign: TextAlign.center,
                  ),
              SizedBox(height: 16.0),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: TextField(
                    controller: _idf,
                    textAlign: TextAlign.center,
                  )),
              SizedBox(height: 24.0),
              Align(
                alignment: Alignment.bottomCenter,
                child: FlatButton(
                  onPressed: () async {
                         final uid=await Provider.of(context).auth.getCurrentUID();
                           await db.collection("Users").document(uid).setData(
                              {
                               'İdfKurali' : _idf.text,
                          },merge: true).then((_){
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
            child: ClipOval(
              child: Image.asset("assets/images/source.gif"),
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
  TextEditingController _karbonhidratkurali = TextEditingController();
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
              SizedBox(height: 16.0),
              Text("Karbonhidrat Kuralınızı Giriniz",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                     fontFamily: "Quicksand"
                  ),
                   textAlign: TextAlign.center,
                  ),
              SizedBox(height: 16.0),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: TextField(
                    controller: _karbonhidratkurali,
                    textAlign: TextAlign.center,
                  )),
              SizedBox(height: 24.0),
              Align(
                alignment: Alignment.bottomCenter,
                child: FlatButton(
                  onPressed: () async {
                    final uid=await Provider.of(context).auth.getCurrentUID();
                           await db.collection("Users").document(uid).setData(
                              {
                               'KarbonhidratKurali' : _karbonhidratkurali.text,
                          },merge: true).then((_){
                            Navigator.pop(context);
                              print("success!");
                       });
                  },
                  child: Text("OLUŞTUR"),
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
              child: Image.asset("assets/images/sekergif.gif"),
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

class CustomDialog3 extends StatelessWidget {
  TextEditingController _insulinMiktari = TextEditingController();
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
              SizedBox(height: 16.0),
              Text("İnsülin Miktarınızı Giriniz",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                     fontFamily: "Quicksand"
                  ),
                   textAlign: TextAlign.center,
                  ),
              SizedBox(height: 16.0),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: TextField(
                    controller: _insulinMiktari,
                    textAlign: TextAlign.center,
                  )),
              SizedBox(height: 24.0),
              Align(
                alignment: Alignment.bottomCenter,
                child: FlatButton(
                  onPressed: () async {
                     final uid=await Provider.of(context).auth.getCurrentUID();
                           await db.collection("Users").document(uid).setData(
                              {
                               'İnsulinMiktari' : _insulinMiktari.text,
                          },merge: true).then((_){

                            Navigator.pop(context);
                              print("success!");
                       });
                  },
                  child: Text("OLUŞTUR"),
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
              child: Image.asset("assets/images/sekergif.gif"),
            ),
            backgroundColor: Colors.white,
            // backgroundImage: AssetImage('assets/images/source.gif',),
            radius: 70,
          ),
        )
      ],
    );
  }
}

class CustomDialog4 extends StatelessWidget {
  TextEditingController _idealkansekeri = TextEditingController();
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
              SizedBox(height: 16.0),
              Text("İdeal Kan Şekerinizi giriniz",
                  style: TextStyle(
                    fontSize: 24.0,
                     fontFamily: "Quicksand",
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                  ),
              SizedBox(height: 16.0),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: TextField(
                    controller: _idealkansekeri,
                    textAlign: TextAlign.center,
                  )),
              SizedBox(height: 24.0),
              Align(
                alignment: Alignment.bottomCenter,
                child: FlatButton(
                  onPressed: () async {
                     final uid=await Provider.of(context).auth.getCurrentUID();
                           await db.collection("Users").document(uid).setData(
                              {
                               'İdealkansekeri' : _idealkansekeri.text,
                          },merge: true).then((_){

                             Navigator.pop(context);
                              print("success!");
                       });
                  },
                  child: Text("OLUŞTUR",style: TextStyle( fontFamily: "Quicksand",fontWeight: FontWeight.w700),
                ),
              )
              )],
          ),
        ),
        Positioned(
          top: 0,
          left: 16,
          right: 16,
          child: CircleAvatar(
            child: ClipOval(
              child: Image.asset("assets/images/sekergif.gif"),
            ),
            backgroundColor: Colors.white,
            // backgroundImage: AssetImage('assets/images/source.gif',),
            radius: 70,
          ),
        )
      ],
    );
  }
}
