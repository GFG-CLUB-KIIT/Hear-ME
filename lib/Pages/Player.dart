import 'package:flutter/material.dart';
import '../Widgets/musicHList.dart';
import '../Widgets/playControl.dart';

class Player extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(9, 18, 39, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text("Playing now"),
      ),
      body: Container(
          child: ListView(
        children: [
          // TODO:Music List Images;         
          ListTile(
            title: Center(child: Text("Monsters Go Bump")),
            subtitle: Center(child: Text("ERIKA RECINOS")),
            trailing: Icon(Icons.thumb_up_outlined),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.volume_up),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.loop),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(Icons.shuffle),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 80),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("00:50"),
                Text("04:50"),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Slider(
              value: 10,
              onChanged: (value) {},
              min: 0,
              max: 100,
            ),
          ),
          playControl(MainAxisAlignment.center),
        ],
      )),
    );
  }
}
