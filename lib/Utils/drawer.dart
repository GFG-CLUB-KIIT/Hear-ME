import  'package:flutter/material.dart';

Widget drawer(){
  return Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(  
              accountName: Text("GFG"),  
              accountEmail: Text("gfg@gmail.com"),  
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
                Icons.home,
              ),
              title: Text("Home"),
            ),
            ListTile(
              leading: Icon(
                Icons.music_note,
              ),
              title: Text("Play List"),
            ),
            ListTile(
              leading: Icon(
                Icons.thumb_up,
              ),
              title: Text("Liked Songs"),
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
              ),
              title: Text("Setting"),
            )
            //Text("Home"),
          ],
        ),
      );
}