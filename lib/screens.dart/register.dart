import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internshiptasks/constants.dart/colors.dart';

class Register extends StatefulWidget {
  final Function toogle;

  Register({required this.toogle});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String password = "";
  String confirm = "";
  final _formKey = GlobalKey<FormState>();
  bool showPassword = true;
  bool showConfirmPassword = true;
  Widget show = Image.asset(
    'assets/Icon awesome-eye@2x.png',
    height: 24,
    width: 24,
  );
  Widget hide = Image.asset(
    'assets/restore-24px.png',
    height: 24,
    width: 24,
  );
  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: brownColor,
      appBar: AppBar(
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: brownColor,
        ),
        backgroundColor: brownColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
              minWidth: widthScreen, minHeight: heightScreen - 100),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0)),
          ),
          child: Container(
            margin: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Text(
                      'Register in to get started',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                  subtitle: Text('Experience the all new App!'),
                ),
                SizedBox(
                  height: 24,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Image.asset('assets/person-24px.png'),
                          hintText: 'Name',
                        ),
                        validator: (val) {
                          val!.isEmpty ? 'Enter name' : null;
                        },
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          prefixIcon: Image.asset('assets/email-24px.png'),
                          hintText: 'E-mail ID',
                        ),
                        validator: (val) {
                          val!.isEmpty ? 'Enter email-ID' : null;
                        },
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          prefixIcon: Image.asset(
                            'assets/phone-24px.png',
                          ),
                          hintText: 'Mobile Number',
                        ),
                        validator: (val) {
                          val!.length != 10 ? 'Enter valid phone number' : null;
                        },
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      TextFormField(
                        onChanged: (val) {
                          setState(() {
                            password = val;
                          });
                        },
                        validator: (val) {
                          val!.isEmpty ? "Enter Password" : null;
                        },
                        obscureText: showPassword,
                        decoration: InputDecoration(
                          prefixIcon: Image.asset(
                            'assets/Icon ionic-ios-lock-2.png',
                            height: 24,
                            width: 24,
                          ),
                          suffix: showPassword
                              ? GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      showPassword = !showPassword;
                                    });
                                  },
                                  child: show)
                              : GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      showPassword = !showPassword;
                                    });
                                  },
                                  child: hide),
                          hintText: 'Password',
                        ),
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      TextFormField(
                        onChanged: (val) {
                          setState(() {
                            confirm = val;
                          });
                        },
                        validator: (value) {
                          value != password ? "Password doesn't match" : null;
                        },
                        obscureText: showConfirmPassword,
                        decoration: InputDecoration(
                          prefixIcon: Image.asset(
                            'assets/Icon ionic-ios-lock-2.png',
                            height: 24,
                            width: 24,
                          ),
                          suffix: showConfirmPassword
                              ? GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      showConfirmPassword =
                                          !showConfirmPassword;
                                    });
                                  },
                                  child: show)
                              : GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      showConfirmPassword =
                                          !showConfirmPassword;
                                    });
                                  },
                                  child: hide),
                          hintText: 'Confirm Password',
                        ),
                      ),
                      SizedBox(
                        height: 32.0,
                      ),
                      Container(
                        width: widthScreen,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              elevation: MaterialStateProperty.all(6),
                              backgroundColor:
                                  MaterialStateProperty.all(orangeColor)),
                          child: Text('REGISTER'),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Processing Data')));
                              
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 32.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Already have an account?'),
                          GestureDetector(
                            onTap: () {
                              widget.toogle();
                            },
                            child: Text(
                              '  Login',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
