import 'package:flutter/material.dart';

import '../Widgets/label.dart';
import '../Widgets/musicHList.dart';
import '../Utils/drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Hear Me"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Icon(Icons.search),
          ),
        ],
      ),
      // TODO: Implement Drawer
      drawer:drawer(), 
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // User Defined Widget in ../Widgets/label.dart
                /*
            lable function provides a way to reuse the code. 
            */
                label("Recommended for you"),
                /* 
                  Recommended For You
              Horizontal Slider (ListView) (../Widgets/musicHList.dart)
            */
                musicHList(),

                // My Playlist Label
                label("My Playlist"),

                // Playlist Horizontal Slider (../Widgets/musicHList.dart)
                musicHList(),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: BottomSheet(
          onClosing: () {},
          builder: (BuildContext context) {
            return Container(
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
                    onTap: (){
                      
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.arrow_left,
                        size: 40,
                      ),
                      Icon(
                        Icons.pause,
                        size: 40,
                      ),
                      Icon(
                        Icons.arrow_right,
                        size: 40,
                      ),
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }
}
