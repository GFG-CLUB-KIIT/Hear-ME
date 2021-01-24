// import 'dart:js';

import 'package:flutter/material.dart';

Widget musicTile(String url, String title, String artist) {
  return Column(
    children: [
      // ClipRRect used to provide border radius
      ClipRRect(
        child: Image.network(
          url,
          width: 200,
          height: 200,
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      // Music Name
      Container(
        width: 200,
        child: ListTile(
          title: Center(
              child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
            ),
          )),
          // width: 180,
          subtitle: Center(
            child: Text(
              artist,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[50],
                fontSize: 10,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
