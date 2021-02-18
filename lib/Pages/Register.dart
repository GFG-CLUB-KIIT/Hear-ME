import 'package:flutter/material.dart';

// import './../Utils/InputWrapper.dart';

import 'HomePage.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegExp regExp = RegExp(
      r"^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9][a-zA-Z0-9-]{0,253}\.)*[a-zA-Z0-9][a-zA-Z0-9-]{0,253}\.[a-zA-Z0-9]{2,}$");

  String email;
  String password;
  String reEnteredPasssword;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            Color.fromRGBO(9, 18, 39, 1),
            Color.fromRGBO(9, 18, 39, 1),
            Color.fromRGBO(9, 18, 39, 1),
          ]),
        ),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 35),
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * .25,
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Text(
                      "REGISTER",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      "Welcome to Hear Me",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  )
                ],
              ),
            ),
            Container(
              // height: MediaQuery.of(context).size.height * .3,
              decoration: BoxDecoration(
                  color: Colors.white,
                  // color: Colors.green,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(60),
                  )),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.grey[200]))),
                        child: TextFormField(
                          validator: (value) {
                            if (value.length <= 0) {
                              return "Enter Email";
                            } else if (!regExp.hasMatch(value)) {
                              return "Invalid Email";
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {
                            email = value;
                          },
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              hintText: "Enter your email",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.grey[200]))),
                        child: TextFormField(
                          validator: (value) {
                            if (value.length <= 6) {
                              return "Password too short";
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {
                            password = value;
                          },
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              hintText: "Enter your password",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.grey[200]))),
                        child: TextFormField(
                          validator: (value) {
                            if (value != password) {
                              return "Password Not Same";
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {
                            reEnteredPasssword = value;
                          },
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              hintText: "Confirm your password",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none),
                        ),
                      ),
                      InkWell(
                        child: Container(
                            width: MediaQuery.of(context).size.width / 2.5,
                            height: MediaQuery.of(context).size.height / 18,
                            margin: EdgeInsets.only(top: 25),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromRGBO(9, 18, 39, 1),
                            ),
                            child: Center(
                              child: Text(
                                'Submit',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            )),
                        //TODO:
                        onTap: () {
                          if (_formKey.currentState.validate()) {}
                          // String emailEntered = email.text;
                          // String passwordEntered = password.text;
                          // String passswordReEntered = reEnteredPasssword.text;
                          // if (passwordEntered == passswordReEntered) {
                          //   if (emailSignUp(
                          //           emailEntered, passwordEntered, context) !=
                          //       null) {
                          //     Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: (context) => HomePage()),
                          //     );
                          //   }
                          // }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
