import 'package:flutter/material.dart';

import 'HomePage.dart';

// class Profile extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Welcome to Flutter',
//       home: Profile()
//     );
//   }
// }

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePage createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Color.fromRGBO(8, 10, 54, 10),
      appBar: AppBar(
          backgroundColor: Color.fromRGBO(8, 10, 54, 10),
          elevation: 0,
          // backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            },
          ),
          title: Text(
            "Profile",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ]),
      body: Container(
          padding: EdgeInsets.only(left: 30, top: 25, right: 16),
          child: ListView(
            children: [
              Text(
                "Edit Profile",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://avatars.githubusercontent.com/u/62473188?s=460&u=467228de100d967026257b0a126d991bc5c7506d&v=4"),
                          )),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
