import 'dart:io';

import 'package:flutter/material.dart';
import 'package:internshiptasks/screens.dart/authentication.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    Object user = Provider.of(context);
    if (user.uid == null) {
      return Authentication();
    } else {
      return Home();
    }
  }
}
