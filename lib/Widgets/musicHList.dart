import 'package:flutter/material.dart';

import '../Widgets/musicTile.dart';

/*
Music Horizontal List
*/
Widget musicHList() {
  return Container(
    margin: EdgeInsets.symmetric(
      vertical: 10.0,
      horizontal: 10.0,
    ),
    // Height of the Horizontal Music List Container
    height: 250.0,
    // ListView.separated to separate the Horizontal Tile
    child: ListView.separated(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      // Scroll Direction Horizontal
      scrollDirection: Axis.horizontal,
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        // imageTile - User Defined Widget (../Widgets/imageTile.dart)
        return musicTile();
      },
      // Separator Builder Function
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          width: 20,
        );
      },
    ),
  );
}
