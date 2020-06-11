  import 'package:cloud_firestore/cloud_firestore.dart';
  import 'package:flutter/material.dart';
  import 'package:font_awesome_flutter/font_awesome_flutter.dart';
  import 'package:glucolives/LoginSignUp_Page/provider_widget.dart';
  import 'package:intl/intl.dart';
  import 'package:intl/date_symbol_data_local.dart';

  final db = Firestore.instance;

  class GunlukKanSekeri extends StatefulWidget {
    @override
    _GunlukKanSekeriState createState() => _GunlukKanSekeriState();
  }

  class _GunlukKanSekeriState extends State<GunlukKanSekeri> {
    final double _smallFontSize = 12;
    final double _valFontSize = 30;
    final FontWeight _smallFontWeight = FontWeight.w500;
    final FontWeight _valFontWeight = FontWeight.w700;
    final Color _fontColor = Color(0xff5b6990);
    final double _smallFontSpacing = 1.3;
    double enyuksekdeger;
    double endusukdeger;
    TextEditingController _sgunlukKanSekeri = TextEditingController();
    TextEditingController _ogunlukKanSekeri = TextEditingController();
    TextEditingController _agunlukKanSekeri = TextEditingController();
    TextEditingController _ggunlukKanSekeri = TextEditingController();


    DateTime _date = DateTime.now().subtract(new Duration(days: 1));
  
    var formatter = new DateFormat('yyyy-MM-dd hh:mm');

  Future<Null> _selectDate(BuildContext context) async {
      DateTime _datepicker = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(1947),
        lastDate:DateTime.now().subtract(new Duration(days: 1)),

        builder: (BuildContext context, Widget child) {
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
        setState(
          () {
            
            _date = _datepicker;
          },
        );
      }
    }
  //Veritabanı İşlemleri:Veritabanından verileri getirme
    void sabitDegerleriGetir() async {
      print(_date.toString());
      final uid = await Provider.of(context).auth.getCurrentUID();
      var formatter = new DateFormat('yyyy-MM-dd');
      String formatted = formatter.format(_date);
      print("${formatted.toString()}");
      db.collection("Users").document(uid).get().then((value) {
        _sgunlukKanSekeri.text =
            value.data["${formatted.toString()}"]["SabahGunlukKanSekeri"];
        _ogunlukKanSekeri.text =
            value.data["${formatted.toString()}"]["ÖğleGunlukKanSekeri"];
        _agunlukKanSekeri.text =
            value.data["${formatted.toString()}"]["AkşamGunlukKanSekeri"];
        _ggunlukKanSekeri.text =
            value.data["${formatted.toString()}"]["GeceGunlukKanSekeri"];
        
          double sseker=double.parse(_sgunlukKanSekeri.text);
          double oseker=double.parse(_ogunlukKanSekeri.text);
          double aseker=double.parse(_agunlukKanSekeri.text);
          double gseker=double.parse(_ggunlukKanSekeri.text);

          List list = [sseker,oseker,aseker,gseker];
          enyuksekdeger=list.reduce((curr, next) => curr > next? curr: next);
          endusukdeger=list.reduce((curr, next) => curr < next? curr: next);
        
      
      
        setState(() {});
          
      });
        

    }
    
  

    @override
    Widget build(BuildContext context) {
      initializeDateFormatting('tr');
            setState(() {
                  sabitDegerleriGetir();
            });

      return Scaffold(
        appBar: buildAppBar(),
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
          alignment: Alignment.topCenter,
          child: ListView(
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("En Yüksek\nKan Şekerim",
                            style: TextStyle(
                              fontWeight: _smallFontWeight,
                              fontSize: _smallFontSize,
                              letterSpacing: _smallFontSpacing,
                              color: _fontColor,
                            )),
                        SizedBox(height: 10),
                        Text(enyuksekdeger.toString(),
                            style: TextStyle(
                              fontWeight: _valFontWeight,
                              fontSize: _valFontSize,
                              color: _fontColor,
                            )),
                        SizedBox(height: 30),
                        Text("En Düşük\nKan Şekerim",
                            style: TextStyle(
                              fontWeight: _smallFontWeight,
                              fontSize: _smallFontSize,
                              letterSpacing: _smallFontSpacing,
                              color: _fontColor,
                            )),
                        SizedBox(height: 10),
                        Text(endusukdeger.toString(),
                            style: TextStyle(
                              fontWeight: _valFontWeight,
                              fontSize: _valFontSize,
                              color: _fontColor,
                            )),
                      ],
                    ),
                    Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                          color: Color(0xfff0f5fb),
                          border: Border.all(width: 8, color: Color(0xffd3e1ed)),
                          borderRadius: BorderRadius.circular(3)),
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "ÖĞÜN VERİSİ",
                            style: TextStyle(
                                fontSize: _smallFontSize,
                                fontWeight: _smallFontWeight,
                                letterSpacing: _smallFontSpacing,
                                color: _fontColor),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 120,
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            width: double.infinity,
                            child: CustomPaint(
                              foregroundPainter: GraphPainter(),
                            ),
                          )
                        ],
                      ),
                    )
                  ]),
              SizedBox(
                height: 25,
              ),
              OgunDegerleri(
                fontColor: _fontColor,
                smallFontSpacing: _smallFontSpacing,
                day: "Sabah",
                tarih: DateFormat.yMMMEd('tr_TR').format(_date),
                sekerDegeri: _sgunlukKanSekeri.text,
              ),
              OgunDegerleri(
                fontColor: _fontColor,
                smallFontSpacing: _smallFontSpacing,
                day: "Öğle",
                tarih: DateFormat.yMMMEd('tr_TR').format(_date),
                sekerDegeri: _ogunlukKanSekeri.text,
              ),
              OgunDegerleri(
                fontColor: _fontColor,
                smallFontSpacing: _smallFontSpacing,
                day: "Akşam",
                tarih: DateFormat.yMMMEd('tr_TR').format(_date),
                sekerDegeri: _agunlukKanSekeri.text,
              ),
              OgunDegerleri(
                fontColor: _fontColor,
                smallFontSpacing: _smallFontSpacing,
                day: "Gece",
                tarih: DateFormat.yMMMEd('tr_TR').format(_date),
                sekerDegeri: _ggunlukKanSekeri.text,
              )
            ],
          ),
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
            },
            icon: Icon(Icons.arrow_back),
            color: Colors.green),
        actions: <Widget>[
          IconButton(
            onPressed: () {
                _sgunlukKanSekeri.text="";
                _agunlukKanSekeri.text="";
                _ogunlukKanSekeri.text="";
                _ggunlukKanSekeri.text="";

              setState(() {
                _selectDate(context);
              sabitDegerleriGetir();

              });
            },
            icon: Icon(FontAwesomeIcons.calendarAlt),
            color: Colors.green,
          )
        ],
      );
    }
  }

  class OgunDegerleri extends StatelessWidget {
    const OgunDegerleri({
      Key key,
      @required Color fontColor,
      @required double smallFontSpacing,
      @required this.day,
      @required this.tarih,
      @required this.sekerDegeri,
    })  : _fontColor = fontColor,
          _smallFontSpacing = smallFontSpacing,
          super(key: key);

    final Color _fontColor;
    final double _smallFontSpacing;
    final String day;
    final String tarih;
    final String sekerDegeri;

    @override
    Widget build(BuildContext context) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
          color: Color(0xffdde9f7),
          width: 1.5,
        ))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              day,
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w700, color: _fontColor),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: <Widget>[
                Text(
                  tarih,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    letterSpacing: _smallFontSpacing,
                    color: _fontColor,
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                Expanded(
                    child: Text(
                  sekerDegeri,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      letterSpacing: _smallFontSpacing,
                      color: _fontColor),
                ))
              ],
            )
          ],
        ),
      );
    }
  }

  class GraphPainter extends CustomPainter {
    //the one in the foreground
    Paint trackBarPaint = Paint()
      ..color = Color(0xff818aab)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 12;

    //the one in the background
    Paint trackPaint = Paint()
      ..color = Color(0xffdee6f1)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 12;

    @override
    void paint(Canvas canvas, Size size) {
      List val = [
        size.height * 0.5,
        size.height * 0.8,
        size.height * 0.3,
        size.height * 0.8,
      ];
      double origin = 8;

      Path trackBarPath = Path();
      Path trackPath = Path();

      for (int i = 0; i < val.length; i++) {
        trackPath.moveTo(origin, size.height);
        trackPath.lineTo(origin, 0);

        trackBarPath.moveTo(origin, size.height);
        trackBarPath.lineTo(origin, val[i]);

        origin = origin + size.width * 0.23;
      }

      canvas.drawPath(trackPath, trackPaint);
      canvas.drawPath(trackBarPath, trackBarPaint);
    }

    @override
    bool shouldRepaint(CustomPainter oldDelegate) {
      // TODO: implement shouldRepaint
      return false;
    }
  }
