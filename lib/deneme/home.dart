import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {

  final FirebaseUser user;

  HomePage({Key key,this.user}):super(key:key);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("Anassayfa"),
      ),
      body: FlatButton(
        child: Text("Deneme"),
        onPressed:(){
                             showDialog(context: context,builder: (context)=>CustomDialog(
                                title: "İşleminiz Başarılı",
                                description: "Girmiş Olduğunuz değerler profilinize eklenmiştir",
                              ));
        }
        ),
      
    );
    
  }
   
  
}
class CustomDialog extends StatelessWidget {
  final String title, description, buttonText;
  final Image image;
  CustomDialog({this.title,this.description,this.buttonText,this.image});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16)
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
  dialogContent(BuildContext context){
    return Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              top: 100,
              bottom: 16,
              left: 16,
              right: 16
            ),
            margin: EdgeInsets.only(top:16),
            decoration: BoxDecoration(
              color:Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(17),
              boxShadow: [
                BoxShadow(
                  color:Colors.black26,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 10.0),
                )
              ]
            ), 
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  title,
                  style:TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                  )
                ),
                SizedBox(height: 16.0),
                Text(description,style: TextStyle(
                  fontSize: 16.0
                ),),
                  SizedBox(height: 24.0),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: FlatButton(
                      onPressed:(){
                        Navigator.pop(context);
                      },
                      child: Text("Tamam"),
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
              backgroundImage: AssetImage("assets/images/basarili-min.gif"),
              radius: 50,
            ),
          )
        ],
    );
  }
}