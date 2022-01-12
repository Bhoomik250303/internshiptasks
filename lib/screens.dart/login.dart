import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internshiptasks/constants.dart/colors.dart';
import 'package:country_code_picker/country_code_picker.dart';
// import 'package:internshiptasks/constants.dart/textformfieldLogin.dart';

class Login extends StatefulWidget {
  Function toogle;

  Login({required this.toogle});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: brownColor,
      appBar: AppBar(
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: brownColor,
        ),
        backgroundColor: brownColor,
      ),
      body: Container(
        constraints: BoxConstraints(
          minWidth: widthScreen,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)),
        ),
        child: Container(
          margin: EdgeInsets.only(top: 16.0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Text('Log in to get started'),
                ),
                subtitle: Text('Experience the all new App!'),
              ),
              SizedBox(
                height: 16.0,
              ),
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: TextFormField(
                          keyboardType: TextInputType.phone,
                          showCursor: true,
                          cursorColor: Colors.yellow,
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 8.0),
                              labelText: 'Phone Number',
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6.0)),
                                  borderSide: BorderSide(color: brownColor)),
                              prefix: TextButton(
                                onPressed: () {},
                                child: CountryCodePicker(
                                  flagWidth: 16.0,
                                  initialSelection: 'IN',
                                  showCountryOnly: false,
                                  showDropDownButton: false,
                                  showOnlyCountryWhenClosed: true,
                                  showFlagMain: true,
                                  showFlagDialog: true,
                                  favorite: ['+91', 'IN'],
                                  enabled: true,
                                  showFlag: true,
                                  alignLeft: true,
                                  padding: EdgeInsets.only(right: 16.0),
                                ),
                              ),
                              counter: TextButton(
                                child: Text(
                                  "Use Email-ID",
                                  style: TextStyle(color: orangeColor),
                                ),
                                onPressed: () {
                                  widget.toogle();
                                },
                              )))))
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Container(
          margin: EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
          decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(orangeColor),
                ),
                onPressed: () {},
                child: Text("Send OTP", style: TextStyle(color: Colors.white))),
          ),
        ),
      ),
    );
  }
}
