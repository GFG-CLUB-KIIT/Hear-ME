import 'package:HearMe/API/saavn.dart';
import 'package:HearMe/Pages/searchList.dart';
import 'package:HearMe/Utils/audio_serviec.dart';
import 'package:HearMe/Widgets/bottomMusicSheet.dart';
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
      extendBody: true,
      backgroundColor: Color.fromRGBO(8, 10, 54, 10),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Hear Me"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
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
      drawer: drawer(context, widget.user),
      body: Container(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  label("Recommended for you"),
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
      bottomSheet: BottomMusicSheet(),
    );
  }
}
