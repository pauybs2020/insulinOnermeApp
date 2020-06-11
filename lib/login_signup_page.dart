import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:glucolives/Animation/FadeAnimation.dart';
import 'package:glucolives/Animation/fadeInFadeOutRoute.dart';
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
class LoginPage extends StatelessWidget {

//final Function(FirebaseUser) onSingIn;

  //const LoginPage({Key key, @required this.onSingIn}) : super(key: key);
 final formkey=new GlobalKey<FormState>();
    
    String _email;
    String _password;
   
     

   void mailkontrol() async{
     try{
       AuthResult result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
       FirebaseUser user = result.user;
       print("object"+user.uid);
     }
     catch(e){
         print("Error= "+e);
     }
   }
    
@override

  @override
  Widget build(BuildContext context) {

    void deneme(){
       Navigator.push(
        context, FadeInFadeOutRoute(builder: (context) => new SignUpPage()));
    }
          SizeConfig().init(context);

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient:LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.orange[900],
              Colors.orange[600],
              Colors.orange[100]

            ]
          )

        
        ),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: SizeConfig.safeBlockVertical *8,),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  
                  FadeAnimation(1.3,Text("Giriş Yap",style: TextStyle(color: Colors.white,fontSize: SizeConfig.safeBlockHorizontal * 8),)),
                  SizedBox(height: SizeConfig.blockSizeHorizontal*2,),
                 FadeAnimation(1.6,Text("Hoşgeldiniz GlucoLivesa",style: TextStyle(color: Colors.white,fontSize: SizeConfig.safeBlockHorizontal * 5),)),  

                ],
              ),
            ),
            SizedBox(height: SizeConfig.safeBlockVertical *3,),
            Expanded(
              child: Container(
                
                decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(70),topRight: Radius.circular(70))
                ),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: SizeConfig.safeBlockVertical *4,),
                      FadeAnimation(1.6,Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [BoxShadow(
                            color: Colors.green,
                            blurRadius: 20,
                            offset: Offset(0,10)
                          )]
                        ),
                        child: new Form(
                          key: formkey,
                           child: Column(
                            children: <Widget>[
                              FadeAnimation(2,Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                ),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    labelText: "Telefon veya E-posta",
                                    labelStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none
                                  ),
                                  onSaved: (value)=> _email=value,
                                  keyboardType: TextInputType.text,
                                ),
                              )),
                                FadeAnimation(2.3,Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                ),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    labelText: "Şifre",
                                    labelStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none
                                  ),
                                  obscureText: true,
                                    onSaved: (value)=> _password=value,
                                   keyboardType: TextInputType.text,

                                ),
                              )),
                            ],
                          ),
                        ),
                      )),
                      SizedBox(height: SizeConfig.safeBlockVertical *6,),
                      FadeAnimation(2.6,Text("Şifremi Unuttum?",style: TextStyle(color: Colors.grey,fontSize: SizeConfig.safeBlockHorizontal * 3),)),
                         SizedBox(height: SizeConfig.blockSizeHorizontal*4,),
                       FadeAnimation(2.8,Container(
                         height: SizeConfig.safeBlockVertical *7,
                         width: SizeConfig.safeBlockHorizontal *50,
                         margin: EdgeInsets.symmetric(horizontal: 50),
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(50),
                           gradient:LinearGradient(
                             colors: [
                              Colors.green[900],
                              Colors.green[600],
                              Colors.green[400]
                              ]
                           ),
                         ),
                         child:FlatButton(
                          
                         child: FadeAnimation(3.1,Text("Giriş",style: TextStyle(),)),
                         onPressed: () {
                        mailkontrol();
                       },
                         
                        textColor: Colors.black,
                       ),
                       
                       )),
                       SizedBox(height:  SizeConfig.safeBlockVertical*4,),
                      FadeAnimation(2.6,Text("Sosyal Medya",style: TextStyle(color: Colors.grey,fontSize: SizeConfig.safeBlockHorizontal * 3),)),
                       SizedBox(height: SizeConfig.safeBlockVertical*6,),

                       Row(
                         children: <Widget>[
                           Expanded(
                             child: FadeAnimation(3.9,Container(
                              height: SizeConfig.safeBlockVertical *7,
                               width: SizeConfig.safeBlockHorizontal *50,
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(50),
                                 gradient:LinearGradient(
                                   colors: [
                                      Colors.blue[900],
                                      Colors.blue[600],
                                      Colors.blue[200]
                                   ]
                                 ),
                                 
                               ),
                               child: Center(
                               child:FlatButton(
                          
                         child: FadeAnimation(3.12,Text("Kayıt Ol ",style: TextStyle(),)),
                        onPressed:deneme,
                        textColor: Colors.black,
                       ),
                               ),
                             )),
                           ),
                           SizedBox(width:SizeConfig.safeBlockHorizontal *5,),
                            Expanded(
                              child: FadeAnimation(4.2,Container(
                                 height: SizeConfig.safeBlockVertical *7,
                                width: SizeConfig.safeBlockHorizontal *50,
                                 decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(50),
                                 color: Colors.red
                               ),
                                child: Center(
                                  child:  Icon(Icons.email, size: 14),
                               
                               ),
                           )),
                            ),
                         ],
                       )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class SignUpPage extends StatelessWidget {

  

   final formkey=new GlobalKey<FormState>();
     String _email;
     String _password;
   
     
  

         

  @override
  Widget build(BuildContext context) {
      
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        
        width: double.infinity,
        decoration: BoxDecoration(
          gradient:LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.blue[900],
              Colors.blue[600],
              Colors.blue[400]

            ]
          )

        
        ),
        
        
        child: Column(


          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
         
            Row(
              children: <Widget>[
                SizedBox(height: 20,),
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: (){
                    Navigator.push(
                         context, FadeInFadeOutRoute(builder: (context) => new LoginPage()));
                  },
                )
              ],
            ),
            SizedBox(height: 40,),
            
            Padding(
              
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[

                 
                  
                  FadeAnimation(1.3,Text("KAYIT OL",style: TextStyle(color: Colors.white,fontSize: 35),)),
                  SizedBox(height: 10,),
                 FadeAnimation(1.6,Text("GlucoLives",style: TextStyle(color: Colors.white,fontSize: 20),)),  

                  
                ],
              ),
            
            ),
            
            SizedBox(height: 10,),
            Expanded(
              child: Container(
                
                decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(70),topRight: Radius.circular(70))
                ),
                child: Padding(
                  padding: EdgeInsets.all(40),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20,),
                      FadeAnimation(1.6,Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [BoxShadow(
                            color: Colors.blue[100],
                            blurRadius: 40,
                            offset: Offset(0,20)
                          )]
                        ),
                        child: new Form(
                          key:formkey,
                            child: Column(
                            children: <Widget>[
                              
                              FadeAnimation(2,Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    labelText: "İsim",
                                    labelStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none
                                  ),
                                  keyboardType: TextInputType.text,
                                ),
                              )),
                              FadeAnimation(2,Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                ),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    labelText: "Telefon veya E-posta",
                                    labelStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none
                                  ),
                                  keyboardType: TextInputType.text,
                                  onSaved: (value)=>_email=value,
                                ),
                              )),
                              FadeAnimation(2,Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                ),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    labelText: "Şifre",
                                    labelStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none
                                  ),
                                  obscureText: true,
                                  keyboardType: TextInputType.text,
                                  onSaved: (value)=>_password=value,
                                ),
                              )),

                            ],
                          ),
                        ),
                      )),
                      
                            SizedBox(height: 30,),
                       FadeAnimation(2.8,Container(
                         height: 50,
                         width: 200,
                         margin: EdgeInsets.symmetric(horizontal: 50),
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(50),
                           gradient:LinearGradient(
                             colors: [
                              Colors.blue[900],
                              Colors.blue[600],
                              Colors.blue[200]
                              ]
                           ),
                         ),
                         child:FlatButton(
                          
                         child: FadeAnimation(3.1,Text("Kayıt Ol",style: TextStyle(),)),
                         onPressed: () {
                        kayitol();
                       },
                         
                        textColor: Colors.black,
                       ),
                       )),
                       
                     
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
 void kayitol() async{
     try{
       var firebaseUser = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);  
       print("object"+firebaseUser.user.uid);
       
     }
     catch(e){
         print("Error= "+e);
     }
   }
}
