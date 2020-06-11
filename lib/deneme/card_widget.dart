import 'package:flutter/material.dart';
import 'package:glucolives/deneme/detail_screen.dart';


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
class CardWidget extends StatelessWidget {

  final String _imageUrl;
  final String _texto;
 
  CardWidget(this._texto, this._imageUrl);

  @override
  Widget build(BuildContext context) {
        SizeConfig().init(context);

    return GestureDetector(
      child: _crearContenedor(),
      onTap: () {
        Navigator.push(
          context, 
          MaterialPageRoute(builder: (context) => DetailScreenn(texto: _texto,imageUrl: _imageUrl,) )
        );
      },
    );
    
  }

  Widget _crearContenedor() {
    
    return Center(
      child: SizedBox(
        height: SizeConfig.safeBlockVertical * 35,
        width: SizeConfig.safeBlockHorizontal * 95,
        child: Container(
          margin: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Color.fromARGB(30, 0, 0, 0),
                offset: Offset(0.0, 10.0),
                spreadRadius: 0,
                blurRadius: 10
              )
            ]
          ),
          child: Card(
              elevation: 0,
              clipBehavior: Clip.antiAlias,
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                    _crearImagenFondo(),
                    Column(
                      children: <Widget>[
                        Container(margin: EdgeInsets.only(top: 10)),
                        _crearHeader(),
                        Expanded(child: Container()),
                        _mensaje()
                      ],
                    )
                ],
              ),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
            ),
        ),
        
      ),  
    );
  }

  Widget _crearHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 10),
          child: Column(
              children: <Widget>[
               // Text('16', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
                //Text('Oct', style: TextStyle(color: Colors.white)),
                //Text('2019', style: TextStyle(color: Colors.white)),
              ],
            ),
        ),
        
      ],
    );
       
  }

  Widget _crearImagenFondo() {
    return Hero(
      child: Image(
        image: AssetImage(_imageUrl),
        fit: BoxFit.cover,
      ),
      tag: _texto,
    );
    
  }

  Widget _mensaje() {
    return Container(
      alignment: Alignment.bottomLeft,
      margin: EdgeInsets.only(bottom: 20, left: 20),
        child: Text( _texto,
            style: TextStyle(
              color: Colors.white,
              fontSize: 30
          ),
        ),
      );
  }

}