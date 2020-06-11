import 'package:flutter/material.dart';
import 'package:glucolives/LoginSignUp_Page/first_view.dart';
import 'package:glucolives/LoginSignUp_Page/provider_widget.dart';
import 'package:glucolives/LoginSignUp_Page/sign_up_view.dart';
import 'package:glucolives/Splash.dart';
import 'package:glucolives/nagivation_button.dart';
import 'package:google_fonts/google_fonts.dart';

import 'LoginSignUp_Page/auth_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      auth: AuthService(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "GlucoLives",
        theme: ThemeData(
          primarySwatch: Colors.blue,

          textTheme: TextTheme(
            body1: GoogleFonts.bitter(fontSize: 14.0)
          )
        ),
        home: Splash(),
        routes: <String, WidgetBuilder>{
          '/home': (BuildContext context) => HomeController(),
          '/signUp': (BuildContext context) => SignUpView(authFormType: AuthFormType.signUp),
          '/signIn': (BuildContext context) => SignUpView(authFormType: AuthFormType.signIn),
          
        },
      ),
    );
  }
}
// veritabanın kayıt Kullanıcıise direk menüye yönledirme eğer kullanıcı kayıt değil yada çıkış yaptıysa giriş paneline yönlendirme
class HomeController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService auth = Provider.of(context).auth;
    return StreamBuilder<String>(
      stream: auth.onAuthStateChanged,
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final bool signedIn = snapshot.hasData;
          return signedIn ? BottomNavBar() : FirstView();
        }
        return CircularProgressIndicator();
      },
    );
  }
}