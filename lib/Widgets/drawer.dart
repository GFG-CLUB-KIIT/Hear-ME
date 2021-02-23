import 'package:HearMe/Pages/HomePage.dart';
import 'package:HearMe/Utils/authentication.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Pages/login.dart';
import '../Pages/playlist.dart';
import '../Pages/developers.dart';
import '../Pages/likedSongs.dart';

Widget drawer(BuildContext context, User user) {
  return Drawer(
    child: Container(
      // color: Color.fromRGBO(9, 18, 39, 1),
      color: Color.fromRGBO(8, 10, 54, 10),

      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.2)),
            // accountName:
            //     Text(user.displayName == null ? "User" : user.displayName,
            //         // "User" : user.displayName,
            //         style: TextStyle(fontSize: 20.0)),
            // accountEmail: Text(user.email == null ? "User" : user.email,
            //     style: TextStyle(fontSize: 20.0)),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.greenAccent,
              child: Text(
                "G",
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),

          ListTile(
            leading: Icon(
              Icons.music_note,
            ),
            title: Text(
              "Playlist",
              style: TextStyle(fontSize: 20.0),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Playlist()),
              );
            },
          ),
          ListTile(
              leading: Icon(
                Icons.thumb_up,
              ),
              title: Text(
                "Liked Songs",
                style: TextStyle(fontSize: 20.0),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LikedSongs()),
                );
              }),
          ListTile(
            leading: Icon(
              Icons.supervisor_account,
            ),
            title: Text("Developers", style: TextStyle(fontSize: 20.0)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Developers()),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
            ),
            title: Text("Setting", style: TextStyle(fontSize: 20.0)),
          ),
          ListTile(
            //TODO:
            onTap: () async {
              await HereMeAuth().logOut();
              //   if (await signOutUser()) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
              //             }
              //             else{
              //               print("Sign in not done");
              //             }
            },
            leading: Icon(Icons.logout),
            title: Text("Sign out", style: TextStyle(fontSize: 20.0)),
          )
          //Text("Home"),
        ],
      ),
    ),
  );
}
