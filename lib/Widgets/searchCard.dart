import 'package:HearMe/Widgets/gradients.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:HearMe/Utils/audio_serviec.dart';
import 'package:HearMe/model/songModel.dart';

class SearchCard extends StatelessWidget {
  final List<SongModel> songs;
  final int index;
  SearchCard(this.songs, this.index);

  @override
  Widget build(BuildContext context) {
    String artistNames = songs[index].artist;
    String songTitle = songs[index].title;
    if (artistNames.length > 50) {
      artistNames = artistNames.substring(0, 40) + '...';
    }
    if (songTitle.length > 40) {
      songTitle = songTitle.substring(0, 35) + '...';
    }
    return Card(
      child: Container(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 80,
              child: ShaderMask(
                shaderCallback: (rect) {
                  return LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(9, 18, 39, 1),
                      Colors.transparent,
                    ],
                  ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                },
                blendMode: BlendMode.dstOver,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    songs[index].imageURL,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Container(
              height: 80,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
                  child: new Container(
                    height: double.infinity,
                    decoration: new BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            ListTile(
              title: Text(songTitle),
              subtitle: Text(artistNames),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: Image.network(
                  songs[index].imageURL,
                ),
              ),
              onTap: () async {
                await initPlayList(songs, index);
              },
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
    );
  }
}
