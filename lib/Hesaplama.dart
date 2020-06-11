import 'package:flutter/material.dart';
import 'package:glucolives/Animation/FadeAnimation.dart';
import 'package:glucolives/Responsive/SizeConfig.dart';
import 'package:glucolives/deneme/circular_clipper.dart';

class DetailScreenn extends StatelessWidget {

  final String _imageUrl;
  final String _texto;

  DetailScreenn(this._texto, this._imageUrl);

  @override
  Widget build(BuildContext context) {
        SizeConfig().init(context);

    return Scaffold(
      backgroundColor: Color(0XFFEFF3F6),
      body: _crearCuerpo(),
    );
    
  }

  Widget _crearCuerpo() {
 
    return ListView(
        children: <Widget>[
         Stack(
        children: <Widget>[
          Container(
            
            transform: Matrix4.translationValues(0.0, -50.0, 0.0),
            child:Hero(
               tag: _texto,
               child: ClipShadowPath(
                 clipper:CircularClipper(),
                 shadow: Shadow(blurRadius: 20.0),
                 child: Image(height: SizeConfig.safeBlockVertical * 45,
                 width: double.infinity,
                 fit: BoxFit.cover,
                 image: AssetImage(_imageUrl),
                 ),
               ),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            
            IconButton(
                padding: EdgeInsets.only(left: SizeConfig.safeBlockVertical * 1),
                onPressed: (){},
                icon: Icon(Icons.arrow_back),
                iconSize: 20.0,
                    color: Colors.black,

            ),
            
          ],
          ),
          //Resmin Alttındaki Yuvarlak Kısım(RawMeterialButton O işe yarıyor)
          Positioned.fill(
            child: Align(
              alignment:Alignment.bottomCenter,
              child: RawMaterialButton(
                padding: EdgeInsets.all(10.0),
                onPressed: ()=> print('Play Video'),
                shape: CircleBorder(),
                fillColor: Colors.white,
                child: Image.asset("assets/images/insulin.png",width: SizeConfig.safeBlockHorizontal * 8,height: SizeConfig.safeBlockVertical * 8,),
                
              ),
            ),

          )
         
        ],
      ),
      Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal *1,vertical: SizeConfig.safeBlockVertical*1), 
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(_texto.toUpperCase(),
          style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5,fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
          )
        ],
      ),
      ),
      Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 3,vertical: SizeConfig.safeBlockVertical*1), 
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25,vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color:Color(0XFFEFF3F6),
        boxShadow: [
        BoxShadow(
      color:Color.fromRGBO(0, 0, 0, 0.1),
            offset: Offset(10, 2),
            blurRadius: 10.0,
            spreadRadius: 3.0
        ),
      BoxShadow(
      color:Color.fromRGBO(255, 255, 255, 0.9),
            offset: Offset(-10, -2),
            blurRadius: 6.0,
            spreadRadius: 3.0
    ),
        ]
    
      ),
  child:Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
    Text("İdeal Kan Şekerini Giriniz"),
    SizedBox(height: 10.0,),
    Container(
      decoration: BoxDecoration(
        color:Color(0XFFEFF3F6),
        borderRadius: BorderRadius.circular(80.0),
        boxShadow: [
          BoxShadow(
            color:Color.fromRGBO(0, 0, 0, 0.1),
            offset: Offset(6, 2),
            blurRadius: 6.0,
            spreadRadius: 3.0
          ),
           BoxShadow(
            color:Color.fromRGBO(255, 255, 255, 0.9),
            offset: Offset(-6, -2),
            blurRadius: 6.0,
            spreadRadius: 3.0
          )
        ]
      ),
      child: TextField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          
          border:InputBorder.none,
          
        ),
      ),
    ),
   SizedBox(height: 10,),
       Text("Karbonhidrat Miktarını Gİriniz"),

    SizedBox(height: 10.0,),
    Container(
      decoration: BoxDecoration(
        color:Color(0XFFEFF3F6),
        borderRadius: BorderRadius.circular(80.0),
        boxShadow: [
          BoxShadow(
            color:Color.fromRGBO(0, 0, 0, 0.1),
            offset: Offset(6, 2),
            blurRadius: 6.0,
            spreadRadius: 3.0
          ),
           BoxShadow(
            color:Color.fromRGBO(255, 255, 255, 0.9),
            offset: Offset(-6, -2),
            blurRadius: 6.0,
            spreadRadius: 3.0
          )
        ]
      ),
      child: TextField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          
          border:InputBorder.none,
          
        ),
      ),
    ),
     SizedBox(height: 10,),
       Text("Seçilen Besin Gramaj Toplamları"),

    SizedBox(height: 10.0,),
    Container(
      decoration: BoxDecoration(
        color:Color(0XFFEFF3F6),
        borderRadius: BorderRadius.circular(80.0),
        boxShadow: [
          BoxShadow(
            color:Color.fromRGBO(0, 0, 0, 0.1),
            offset: Offset(6, 2),
            blurRadius: 6.0,
            spreadRadius: 3.0
          ),
           BoxShadow(
            color:Color.fromRGBO(255, 255, 255, 0.9),
            offset: Offset(-6, -2),
            blurRadius: 6.0,
            spreadRadius: 3.0
          )
        ]
      ),
      child: TextField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          
          border:InputBorder.none,
          
        ),
      ),
      
    ),
     
        SizedBox(height: 30,),
                       FadeAnimation(2.8,Container(
                         height: 50,
                         width: 300,
                         margin: EdgeInsets.symmetric(horizontal: 80),
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(60),
                           gradient:LinearGradient(
                             colors: [
                              Colors.green[900],
                              Colors.green[600],
                              Colors.green[200]
                              ]
                           ),
                         ),
                         child:FlatButton(
                          
                         child: FadeAnimation(3.1,Text("Besin Seçimi",style: TextStyle(),)),
                         onPressed: () {
                        print("Butona 1 Kez Tıklandı");
                       },
                         
                        textColor: Colors.black,
                       ),
                       )),
                       
       SizedBox(height: 30,),
                       FadeAnimation(2.8,Container(
                         height: 50,
                         width: 300,
                         margin: EdgeInsets.symmetric(horizontal: 80),
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(60),
                           gradient:LinearGradient(
                             colors: [
                              Colors.blue[900],
                              Colors.blue[600],
                              Colors.blue[200]
                              ]
                           ),
                         ),
                         child:FlatButton(
                          
                         child: FadeAnimation(3.1,Text("Hesapla",style: TextStyle(),)),
                         onPressed: () {
                        print("Butona 1 Kez Tıklandı");
                       },
                         
                        textColor: Colors.black,
                       ),
                       )),
                       
    ],
  ),
  
        ), 
        
      )
        ],
    );

  }

}
BoxDecoration nMbtn = BoxDecoration(
  borderRadius: BorderRadius.circular(10),
  color:Colors.grey.shade100,
  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.075),
      offset: Offset(2, 2),
      blurRadius: 2,
    )
  ]
);