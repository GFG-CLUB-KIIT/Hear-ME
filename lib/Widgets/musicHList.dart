import 'package:flutter/material.dart';

import '../Widgets/musicTile.dart';
import '../Utils/audio_serviec.dart';

/*
Music Horizontal List
*/
Widget musicHList(var data) {
  return Container(
    margin: EdgeInsets.symmetric(
      vertical: 10.0,
      horizontal: 10.0,
    ),
    // Height of the Horizontal Music List Container

    height: 300.0,
    // ListView.separated to separate the Horizontal Tile
    child: ListView.separated(
      physics: BouncingScrollPhysics(),
      // Scroll Direction Horizontal
      scrollDirection: Axis.horizontal,
      itemCount: data.length,

      itemBuilder: (BuildContext context, int index) {
        // imageTile - User Defined Widget (../Widgets/imageTile.dart)

        return GestureDetector(
          onTap: () async {
            await initPlayList(data, index);
          },
          child: musicTile(
            data[index].imageURL,
            data[index].title,
            data[index].artist,
          ),
        );
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
