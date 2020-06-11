import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:glucolives/LoginSignUp_Page/provider_widget.dart';
import 'package:glucolives/Veriler/app_thema.dart';
import 'package:glucolives/Veriler/chart_widget.dart';
import 'package:glucolives/food.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

final db = Firestore.instance;

class Veriler extends StatefulWidget {
  @override
  _VerilerState createState() => _VerilerState();
}

class _VerilerState extends State<Veriler> {
  TextEditingController _sKarbonhidratMiktari = TextEditingController();
  TextEditingController _sinsulinMiktari = TextEditingController();
  TextEditingController _sgunlukKanSekeri = TextEditingController();

  TextEditingController _oKarbonhidratMiktari = TextEditingController();
  TextEditingController _oinsulinMiktari = TextEditingController();
  TextEditingController _ogunlukKanSekeri = TextEditingController();

  TextEditingController _aKarbonhidratMiktari = TextEditingController();
  TextEditingController _ainsulinMiktari = TextEditingController();
  TextEditingController _agunlukKanSekeri = TextEditingController();

  TextEditingController _gKarbonhidratMiktari = TextEditingController();
  TextEditingController _ginsulinMiktari = TextEditingController();
  TextEditingController _ggunlukKanSekeri = TextEditingController();

  TextEditingController _toplaminsulinMiktari = TextEditingController();
  TextEditingController _toplamKarbonhidratMiktari = TextEditingController();

  DateTime _date = DateTime.now().subtract(new Duration(days: 1));
  var formatter = new DateFormat('yyyy-MM-dd hh:mm');

  Future<Null> _selectDate(BuildContext context) async {
    DateTime _datepicker = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(1947),
      lastDate: DateTime.now().subtract(new Duration(days: 1)),
      builder: (BuildContext context, Widget child) {
        initializeDateFormatting('tr');
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.lightGreen[500],
            accentColor: Colors.lightGreen[500],
            colorScheme: ColorScheme.light(primary: Colors.lightBlue[500]),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child,
        );
        
      },
    );
    if (_datepicker != null && _datepicker != _date) {
        _sKarbonhidratMiktari.text=("0");
        _oKarbonhidratMiktari.text="sıfır";
      setState(() {
        _date = _datepicker;
      },

      );
           

    }
     
  }

  void sabitDegerleriGetir() async {
    print(_date.toString());
    final uid = await Provider.of(context).auth.getCurrentUID();
     var formatter = new DateFormat('yyyy-MM-dd');
    String formatted = formatter.format(_date);
    print("${formatted.toString()}");
    db.collection("Users").document(uid)
      .get().then((value) {
        
         _sKarbonhidratMiktari.text=value.data["${formatted.toString()}"]["SabahKarbonHidratMiktari"];
         _sinsulinMiktari.text=value.data["${formatted.toString()}"]["SabahİnsulinMiktari"];
         _sgunlukKanSekeri.text=value.data["${formatted.toString()}"]["SabahGunlukKanSekeri"];

         _oKarbonhidratMiktari.text=value.data["${formatted.toString()}"]["ÖğleKarbonHidratMiktari"];
         _oinsulinMiktari.text=value.data["${formatted.toString()}"]["ÖğleİnsulinMiktari"];
         _ogunlukKanSekeri.text=value.data["${formatted.toString()}"]["ÖğleGunlukKanSekeri"];

         _aKarbonhidratMiktari.text=value.data["${formatted.toString()}"]["AkşamKarbonHidratMiktari"];
         _ainsulinMiktari.text=value.data["${formatted.toString()}"]["AkşamİnsulinMiktari"];
         _agunlukKanSekeri.text=value.data["${formatted.toString()}"]["AkşamGunlukKanSekeri"];

         _gKarbonhidratMiktari.text=value.data["${formatted.toString()}"]["GeceKarbonHidratMiktari"];
         _ginsulinMiktari.text=value.data["${formatted.toString()}"]["GeceİnsulinMiktari"];
         _ggunlukKanSekeri.text=value.data["${formatted.toString()}"]["GeceGunlukKanSekeri"];
          
        double toplam=double.parse(_sinsulinMiktari.text)+double.parse(_oinsulinMiktari.text)+double.parse(_ainsulinMiktari.text)+double.parse(_ginsulinMiktari.text);
        double toplam2=double.parse(_sKarbonhidratMiktari.text)+double.parse(_oKarbonhidratMiktari.text)+double.parse(_aKarbonhidratMiktari.text)+double.parse(_gKarbonhidratMiktari.text);

        _toplaminsulinMiktari.text=toplam.toString();
        _toplamKarbonhidratMiktari.text=toplam2.toString();
        print(toplam.toString());
        setState(() {});

      });
  }

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('tr');
    sabitDegerleriGetir();
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 250,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: const FractionalOffset(1.0, 1.0),
                        end: const FractionalOffset(0.2, 0.2),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp,
                        colors: [
                          Colors.lightBlue,
                          Colors.lightGreen.withOpacity(.7)
                        ]),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                padding: EdgeInsets.only(top: 25),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: 15.0,
                  left: 1.0,
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.arrow_back),
                          iconSize: 25,
                          color: Colors.white,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                DateFormat.yMMMEd('tr_TR').format(
                                    _date), //Ürettiği tarih formatı: Sat, Aug 31, 2019,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'Quicksand',
                                  fontSize: 16,
                                ),
                              ),
                              IconButton(
                                icon: Icon(FontAwesomeIcons.calendarAlt),
                                iconSize: 25,
                                color: Colors.white,
                                onPressed: () {
                                
                                  
                                  setState(() {
                                
                                     _selectDate(context);
                                   sabitDegerleriGetir();

                                  });
                                   
                                 
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        "İnsulin Ve Karbonhidrat Miktarları",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Quicksand',
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    _buildStatistic(),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: _buildGender(
                                "assets/images/insulin.png",
                                Colors.lightBlue,
                                "Sabah",
                                _sinsulinMiktari.text,
                                "İnsulin\nMiktari"),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: _buildGender(
                                "assets/images/fruit.png",
                                Colors.lightGreen,
                                "Sabah",
                                _sKarbonhidratMiktari.text,
                                "Karbonhidrat\nMiktari"),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(14),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: _buildGender(
                                "assets/images/insulin.png",
                                Colors.lightBlue,
                                "Öğle",
                                _oinsulinMiktari.text,
                                "İnsulin\nMiktari"),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: _buildGender(
                                "assets/images/fruit.png",
                                Colors.lightGreen,
                                "Öğle",
                                _oKarbonhidratMiktari.text,
                                "Karbonhidrat\nMiktari"),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(14),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: _buildGender(
                                "assets/images/insulin.png",
                                Colors.lightBlue,
                                "Akşam",
                                _ainsulinMiktari.text,
                                "İnsulin\nMiktari"),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: _buildGender(
                                "assets/images/fruit.png",
                                Colors.lightGreen,
                                "Akşam",
                                _aKarbonhidratMiktari.text,
                                "Karbonhidrat\nMiktari"),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(14),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: _buildGender(
                                "assets/images/insulin.png",
                                Colors.lightBlue,
                                "Gece",
                                _ginsulinMiktari.text,
                                "İnsulin\nMiktari"),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: _buildGender(
                                "assets/images/fruit.png",
                                Colors.lightGreen,
                                "Gece",
                                _gKarbonhidratMiktari.text,
                                "Karbonhidrat\nMiktari"),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGender(String resimYolu, Color color, String title, String value,
      String aciklama) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        border: Border.all(color: Colors.white),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(1, 1),
            spreadRadius: 1,
            blurRadius: 1,
          ),
        ],
      ),
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        begin: const FractionalOffset(1.0, 1.0),
                        end: const FractionalOffset(0.2, 0.2),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp,
                        colors: [
                          Colors.lightBlue,
                          Colors.lightGreen.withOpacity(.7)
                        ])),
                child: Image.asset(
                  resimYolu,
                  fit: BoxFit.fill,
                  width: 50,
                  height: 50,
                ),
              ),
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontFamily: 'Quicksand',
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    aciklama,
                    style: TextStyle(
                      color: Colors.black38,
                      fontFamily: 'Quicksand',
                      fontSize: 13,
                      height: 1,
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            value,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontFamily: 'Quicksand',
              fontSize: 28,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildStatistic() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        border: Border.all(color: Colors.white),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(1, 1),
            spreadRadius: 1,
            blurRadius: 1,
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.all(24),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: 130,
              height: 130,
              child: DonutPieChart.withSampleData(),
            ),
            SizedBox(width: 25),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildStatisticItem(Colors.lightBlue, "insulin", _toplaminsulinMiktari.text),
                  _buildStatisticItem(Colors.lightGreen, "Karbonhidrat", _toplamKarbonhidratMiktari.text),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatisticItem(Color color, String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Icon(
          FlutterIcons.label,
          size: 50,
          color: color,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 5),
            Text(value),
          ],
        ),
      ],
    );
  }
}
