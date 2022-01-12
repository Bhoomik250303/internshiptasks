import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:internshiptasks/constants.dart/colors.dart';
import 'package:internshiptasks/services.dart/authentication.dart';
import 'package:internshiptasks/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      initialData: [],
      value: AuthService().userData,
      builder: (context, snapshot) {
        return SplashScreen(
          backgroundColor: brownColor,
          seconds: 3,
          navigateAfterSeconds: Wrapper(),
          image: Image.asset('assets/shopping_bag-24px@3x.png'),
          photoSize: 56.0,
          loaderColor: orangeColor,
        );
      },
    );
  }
}
