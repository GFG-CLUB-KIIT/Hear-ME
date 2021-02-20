import 'package:flutter/material.dart';

Row playControl(MainAxisAlignment alignment) {
  LinearGradient gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Colors.indigo.withOpacity(0.6), Colors.black]);

  // BoxShadow shadow = BoxShadow(
  //   color: Colors.grey,
  //   spreadRadius: 2,
  //   blurRadius: 2,
  //   offset: Offset(2, 4),
  // );

  BoxDecoration decoration = BoxDecoration(
    gradient: gradient,
    borderRadius: BorderRadius.all(
      Radius.circular(100),
    ),
    // boxShadow: [shadow],
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
