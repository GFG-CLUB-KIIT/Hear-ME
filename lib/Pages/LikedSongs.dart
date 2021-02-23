import 'package:HearMe/API/saavn.dart';
import 'package:HearMe/Pages/searchList.dart';
import 'package:HearMe/Widgets/bottomMusicSheet.dart';
import 'package:HearMe/Widgets/playControl.dart';
import 'package:flutter/material.dart';

import '../Widgets/label.dart';
import '../Widgets/musicVList.dart';
import 'player.dart';

class LikedSongs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(8, 10, 54, 10),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(child: Text("Liked Songs")),
        actions: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: IconButton(
              icon: Icon(Icons.music_note),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchList()));
              },
            ),
          ),
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              FutureBuilder(
                future: topSongs(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return musicVList(context, snapshot.data);
                },
              ),
            ],
          ),
        ),
      ),
      bottomSheet: BottomMusicSheet(),
    );
  }
}
