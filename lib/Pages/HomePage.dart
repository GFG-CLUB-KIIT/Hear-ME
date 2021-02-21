import 'package:HearMe/API/saavn.dart';
import 'package:HearMe/Pages/searchList.dart';
import 'package:HearMe/Utils/audio_serviec.dart';
import 'package:HearMe/Widgets/playControl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../model/songModel.dart';

import '../Widgets/label.dart';
import '../Widgets/musicHList.dart';
import '../Widgets/drawer.dart';
import 'player.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
    @required this.user,
  }) : super(key: key);
  final User user;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    initAudio();
    super.initState();
  }

  @override
  void dispose() {
    disposeAudio();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(9, 18, 39, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Hear Me"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchList()));
              },
            ),
          ),
        ],
      ),
      // TODO: Implement Drawer
      drawer: drawer(context, widget.user),
      body: Container(
        //decoration: BoxDecoration(gradient: LinearGradient(colors: [Color.fromRGBO(9,18,39,1),Color.fromRGBO(9, 9, 9, 1.0)])),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // User Defined Widget in ../Widgets/label.dart
                  /*
              lable function provides a way to reuse the code. 
              */
                  label("Recommended for you"),
                  /* 
                    Recommended For You
                    //TODO: Dynamic implimentation
                  
              */

                  //Top songs
                  label("Top Songs"),
                  FutureBuilder<List<SongModel>>(
                    future: topSongs(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return musicHList(snapshot.data);
                    },
                  ),

                  // My Playlist Label
                  label("My Playlist"),

                  SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomSheet: BottomSheet(
          backgroundColor: Colors.transparent,
          onClosing: () {},
          builder: (BuildContext context) {
            return Container(
              color: Color.fromRGBO(9, 18, 39, 1),
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: Row(
                      children: [
                        Image.asset(
                          "Assets/Images/monsters-go-bump.jpg",
                          fit: BoxFit.cover,
                          width: 60,
                          height: 60,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Monsters Go Bump"),
                            Text("ERIKA RECINOS",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10,
                                )),
                          ],
                        )
                      ],
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Player()));
                    },
                  ),
                  // playControl(MainAxisAlignment.spaceBetween),
                  IconButton(
                    icon: Icon(Icons.play_arrow),
                    iconSize: 30,
                    onPressed: () {},
                  )
                ],
              ),
            );
          }),
    );
  }
}
