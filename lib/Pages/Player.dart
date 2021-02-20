import 'package:flutter/material.dart';
import '../Widgets/musicHList.dart';
import '../Widgets/playControl.dart';

class Player extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(232222),
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
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 300,
                child: Image.asset(
                  'Assets/Images/monsters-go-bump.jpg',
                  fit: BoxFit.fitWidth,
                ),
              ),
              Container(
                width: double.infinity,
                height: 300,
                color: Colors.black.withOpacity(0.5),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  height: 250,
                  width: 250,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(1000.0),
                    child: Image.asset(
                      'Assets/Images/monsters-go-bump.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
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
