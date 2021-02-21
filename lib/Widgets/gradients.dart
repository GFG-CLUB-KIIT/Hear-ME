import 'package:flutter/material.dart';

RadialGradient radialGradient(Map<String, Color> color) => RadialGradient(
      colors: [color['lightColor'].withOpacity(0.6), color['darkColor']],
    );

LinearGradient linearGradient(Map<String, Color> color) => LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [color['lightColor'], color['darkVibrantColor']],
    );
