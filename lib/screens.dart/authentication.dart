import 'package:flutter/material.dart';
import 'package:internshiptasks/screens.dart/login.dart';
import 'package:internshiptasks/screens.dart/register.dart';

class Authentication extends StatefulWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  bool toogle = false;

  void _toogleBtw() {
    setState(() {
      toogle = !toogle;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (toogle) {
      return Register(
        toogle: _toogleBtw,
      );
    }
    return Login(
      toogle: _toogleBtw,
    );
  }
}
