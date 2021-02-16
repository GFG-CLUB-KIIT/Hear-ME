import 'package:HearMe/Utils/Authentication.dart';
import 'package:flutter/material.dart';

import './../Utils/Header.dart';
import './../Utils/InputWrapper.dart';
import 'HomePage.dart';
import 'Register.dart';

class LoginPage extends StatelessWidget {
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
            Header("Login"),
            Container(
              //height: MediaQuery.of(context).size.height * .7,

              decoration: BoxDecoration(
                  color: Colors.white,
                  // color: Colors.green,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(60),
                  )),
              child: InputWrapper(),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                    child: Container(
                        width: MediaQuery.of(context).size.width / 2.5,
                        height: MediaQuery.of(context).size.height / 18,
                        margin: EdgeInsets.only(top: 25),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              'Sign in with',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Container(
                              height: 30.0,
                              width: 30.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage('Assets/Images/google.png'),
                                    fit: BoxFit.cover),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ))),
                    onTap: () async {
                      if (await googleSignInAccount()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      }
                      else{
                        print("Sign in not done");
                      }
                      
                    }),
                InkWell(
                  child: Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: MediaQuery.of(context).size.height / 18,
                      margin: EdgeInsets.only(top: 25),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Center(
                        child: Text(
                          'Register',
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      )),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
