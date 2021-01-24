import 'package:flutter/material.dart';

Row playControl (MainAxisAlignment alignment){
  return Row(
    mainAxisAlignment: alignment,
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
); 
} 
