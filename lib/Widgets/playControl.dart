import 'package:flutter/material.dart';

import './gradients.dart';

Row playControl(MainAxisAlignment alignment, Map<String, Color> color) {
  BoxDecoration decoration = BoxDecoration(
    gradient: linearGradient(color),
    borderRadius: BorderRadius.all(
      Radius.circular(100),
    ),
  );

  return Row(
    mainAxisAlignment: alignment,
    children: [
      Container(
        child: IconButton(
          icon: Icon(Icons.arrow_left),
          iconSize: 40,
          color: Colors.white,
          onPressed: () {},
        ),
        decoration: decoration,
      ),
      SizedBox(
        width: 20,
      ),
      Container(
        child: IconButton(
          icon: Icon(Icons.pause),
          iconSize: 50,
          color: Colors.white,
          onPressed: () {},
        ),
        decoration: decoration,
      ),
      SizedBox(
        width: 20,
      ),
      Container(
        child: IconButton(
          icon: Icon(Icons.arrow_right),
          iconSize: 40,
          color: Colors.white,
          onPressed: () {},
        ),
        decoration: decoration,
      ),
    ],
  );
}
