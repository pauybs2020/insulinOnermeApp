import 'package:flutter/material.dart';
import 'package:glucolives/Animation/text.dart';
class SizeConfig {
			static MediaQueryData _mediaQueryData;
			static double screenWidth;
			static double screenHeight;
			static double blockSizeHorizontal;
			static double blockSizeVertical;
			
			static double _safeAreaHorizontal;
			static double _safeAreaVertical;
			static double safeBlockHorizontal;
			static double safeBlockVertical;
			
			void init(BuildContext context) {
				_mediaQueryData = MediaQuery.of(context);
				screenWidth = _mediaQueryData.size.width;
				screenHeight = _mediaQueryData.size.height;
				blockSizeHorizontal = screenWidth / 100;
				blockSizeVertical = screenHeight / 100;
				
				_safeAreaHorizontal = _mediaQueryData.padding.left + 
					_mediaQueryData.padding.right;
				_safeAreaVertical = _mediaQueryData.padding.top +
					_mediaQueryData.padding.bottom;
				safeBlockHorizontal = (screenWidth -
					_safeAreaHorizontal) / 100;
				safeBlockVertical = (screenHeight -
					_safeAreaVertical) / 100;
			}
		}
class OgunSecimi extends StatefulWidget {
  
  @override
  _OgunSecimiState createState() => _OgunSecimiState();
}

class _OgunSecimiState extends State<OgunSecimi> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        
       appBar: new AppBar(
        title: Image.asset('assets/images/logo.png',height: SizeConfig.safeBlockVertical * 17,),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {}, icon: Icon(Icons.arrow_back), color: Colors.green),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.home),
            color: Colors.green,
          )
         
        ],
      ),
      
      body: ListView(
        
       shrinkWrap: true,
       scrollDirection: Axis.horizontal,
       children: <Widget>[
          Container(
            alignment: Alignment(0.0, -0.40),
                color: Colors.white30,
              child:Column(
                
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                   Textyonu(
                  text:'ÖĞÜN SEÇİMİ',
                  
                ),
                ],
               
              )
                
              ),
              Container(
                child:
                _buildCard('Hesaplama', 'Açıklama', 1,'assets/images/sugar.png'),
              )

                
       ],
       

      ),
    );
  }
  Widget _buildCard(String name, String status, int cardIndex,String img,) {
    return Container(
          height: 500,
          width: SizeConfig.safeBlockHorizontal * 40,

          child: InkWell(
         onTap: (){ 
           if(cardIndex==1){
           
           }
          },
            child: Card( 
           shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)
          ),
           
          elevation: 7.0,
          child: Column(
            children: <Widget>[
              
              SizedBox(height: 15.0),
              Stack(
                children: <Widget>[
                  Container(
                    height: SizeConfig.safeBlockVertical*20,
                    width: SizeConfig.safeBlockHorizontal*10.6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.0),
                      color: Colors.green,
                      image: DecorationImage(
                        image: AssetImage(img),
                         
                      )
                    ),
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
                      color: Colors.grey
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Expanded(
                    child: Container(
                      
                      width: 175.0,
                      decoration: BoxDecoration(
                        //color: status == 'Away' ? Colors.grey: Colors.green,
                        color: Colors.green,
                        borderRadius: BorderRadius.only
                        (
                          bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0)
                      ),
                    ),
                    child: Center(
                      child: Text('',
                      style: TextStyle(
                        color: Colors.white, fontFamily: 'Quicksand'
                      ),
                    ),
                  ),
                   
          
                  )
                  )
                  
                ],
              ),
          margin: cardIndex.isEven? EdgeInsets.fromLTRB(10.0, 0.0, 25.0, 10.0):EdgeInsets.fromLTRB(25.0, 0.0, 5.0, 10.0)
         ),
      ),
    );
  }
}
 