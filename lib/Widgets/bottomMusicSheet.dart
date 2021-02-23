import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:HearMe/Pages/Player.dart';

class BottomMusicSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      backgroundColor: Colors.black,
      onClosing: () {},
      builder: (BuildContext context) {
        return Container(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 70,
                child: ShaderMask(
                  shaderCallback: (rect) {
                    return LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(9, 18, 39, 1),
                        // Colors.black,
                        Colors.transparent,
                      ],
                    ).createShader(
                        Rect.fromLTRB(0, 0, rect.width, rect.height));
                  },
                  blendMode: BlendMode.dstOver,
                  child: Image.asset(
                    "Assets/Images/tera-zikr.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                height: 70,
                child: ClipRRect(
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
              ),
              ListTile(
                dense: true,
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    "Assets/Images/tera-zikr.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text("Monsters Go Bump"),
                subtitle: Text("Artist"),
                trailing: IconButton(
                  icon: Icon(Icons.play_arrow),
                  iconSize: 30,
                  onPressed: () {},
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Player(),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

// Container(
//                 height: 60,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     InkWell(
//                       child: Row(
//                         children: [
//                           Image.asset(
//                             "Assets/Images/tera-zikr.jpg",
//                             fit: BoxFit.cover,
//                             width: 60,
//                             height: 60,
//                           ),
//                           SizedBox(
//                             width: 5,
//                           ),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text("Monsters Go Bump"),
//                               Text("ERIKA RECINOS",
//                                   style: TextStyle(
//                                     color: Colors.grey,
//                                     fontSize: 10,
//                                   )),
//                             ],
//                           )
//                         ],
//                       ),
//                       onTap: () {
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: (context) => Player()));
//                       },
//                     ),
//                     // playControl(MainAxisAlignment.spaceBetween),
//                     IconButton(
//                       icon: Icon(Icons.play_arrow),
//                       iconSize: 30,
//                       onPressed: () {},
//                     )
//                   ],
//                 ),
//               ),
