import 'package:flutter/material.dart';
import './Pages/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Hear Me",
        home: Scaffold(
          appBar: AppBar(
            title: Text("Hear Me"),
          ),
          drawer: Drawer(),
          body: HomePage(),
        ));
  }
}
