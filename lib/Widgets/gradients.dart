import 'package:flutter/material.dart';

RadialGradient radialGradient(Map<String, Color> color) => RadialGradient(
      colors: [color['lightVibrantColor'], color['darkVibrantColor']],
    );

LinearGradient linearGradient(Map<String, Color> color) => LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [color['lightVibrantColor'], color['darkVibrantColor']],
    );
