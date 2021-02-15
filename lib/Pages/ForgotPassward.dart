import 'package:HearMe/Utils/ForgotPasswordFields.dart';
import 'package:HearMe/Utils/Header.dart';
import "package:flutter/material.dart";


class ForgotPassword extends StatelessWidget {
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
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SizedBox(height:80),
            Header("Forgot Passward"),
            SizedBox(height:80),
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
                padding: const EdgeInsets.symmetric(vertical: 50,horizontal:20),
                child:ForgotPasswordFields() ,
              ),
            ),
        //      Container(
        //   padding: EdgeInsets.all(10),
        //   decoration: BoxDecoration(
        //       border: Border(bottom: BorderSide(color: Colors.grey[200]))),
        //   child: TextField(
        //     decoration: InputDecoration(
        //         hintText: "Enter your email",
        //         hintStyle: TextStyle(color: Colors.grey),
        //         border: InputBorder.none),
        //   ),
        // ),
          ],
        ),
      ),
    );
  }
}