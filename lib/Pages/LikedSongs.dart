import 'package:HearMe/API/saavn.dart';
import 'package:HearMe/Pages/searchList.dart';
import 'package:HearMe/Widgets/playControl.dart';
import 'package:flutter/material.dart';

import '../Widgets/label.dart';
import '../Widgets/musicVList.dart';
import 'player.dart';

class LikedSongs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(9, 18, 39, 1),
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
