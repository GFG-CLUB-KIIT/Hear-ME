import 'package:HearMe/Pages/HomePage.dart';
import 'package:flutter/material.dart';
import './Authentication.dart';

class RegisterFields extends StatefulWidget {
  @override
  _RegisterFieldsState createState() => _RegisterFieldsState();
}

class _RegisterFieldsState extends State<RegisterFields> {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController reEnteredPasssword = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey[200]))),
          child: TextField(
            style: TextStyle(color: Colors.black),
            controller: email,
            decoration: InputDecoration(
                hintText: "Enter your email",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey[200]))),
          child: TextField(
            style: TextStyle(color: Colors.black),
            controller: password,
            decoration: InputDecoration(
                hintText: "Enter your password",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey[200]))),
          child: TextField(
            style: TextStyle(color: Colors.black),
            controller: reEnteredPasssword,
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
          onTap: () {
            String emailEntered = email.text;
            String passwordEntered = password.text;
            String passswordReEntered = reEnteredPasssword.text;
            if (passwordEntered == passswordReEntered) {
              if (emailSignUp(emailEntered, passwordEntered, context) != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              }
            }
          },
        ),
      ],
    );
  }
}
