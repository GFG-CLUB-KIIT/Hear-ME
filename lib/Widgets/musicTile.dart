import 'package:flutter/material.dart';

/*
Single Music TIle
TODO:
Width: ?
Height: ?
Fetch Music
*/

Widget musicTile() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      // ClipRRect used to provide border radius
      ClipRRect(
        child: Image.asset(
          'Assets/Images/monsters-go-bump.jpg',
          width: 200,
          height: 200,
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      // Music Name
      Text("Monsters Go Bump"),
      // Artist Name
      Text(
        "ERIKA RECINOS",
        style: TextStyle(
          color: Colors.grey,
          fontSize: 10,
        ),
      ),
    ],
  );
}
