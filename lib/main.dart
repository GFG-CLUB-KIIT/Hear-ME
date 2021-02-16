import 'package:HearMe/Pages/Login.dart';
import 'package:HearMe/Utils/Authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './Pages/HomePage.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.dark,
      title: "Hear Me",
      home: IsUserLogedIn(),
    );
  }
}

class IsUserLogedIn extends StatefulWidget {
  const IsUserLogedIn({
    Key key,
  }) : super(key: key);

  @override
  _IsUserLogedInState createState() => _IsUserLogedInState();
}

class _IsUserLogedInState extends State<IsUserLogedIn> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: isUserAvaliable(),
      builder: (context, snapshot) {
        if (snapshot.data == true) {
          // User user = snapshot.data;
          return HomePage();
        } else {
          return LoginPage();
        }
      },
    );
  }
}
