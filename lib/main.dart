import 'package:flutter/material.dart';
import 'Pages/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Pages/HomePage.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
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
      // home: LoginPage()
    );
  }
}

class IsUserLogedIn extends StatefulWidget {
  IsUserLogedIn({Key key}) : super(key: key);

  @override
  _IsUserLogedInState createState() => _IsUserLogedInState();
}

class _IsUserLogedInState extends State<IsUserLogedIn> {
  FirebaseAuth auth;
  @override
  void initState() {
    auth = FirebaseAuth.instance;
    print(auth.currentUser.displayName);
    print(auth.currentUser.email);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return auth.currentUser != null
        ? HomePage(
            user: auth.currentUser,
          )
        : LoginPage();
  }
}
