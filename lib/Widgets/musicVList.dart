import 'package:flutter/material.dart';

import '../Widgets/musicTile.dart';

/*
Music Vertical List
*/
Widget musicVList(BuildContext context, var data) {
  return Container(
    margin: EdgeInsets.symmetric(
      vertical: 10.0,
      horizontal: 10.0,
    ),
    height: MediaQuery.of(context).size.height * 0.72,
    child: GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      childAspectRatio: 0.58,
      children: List.generate(
        10,
        (index) {
          return musicTile(data[index]["image"], data[index]["title"],
              data[index]["more_info"]["album"]);
        },
      ),
    ),
  );
}
// return musicTile(data[index]["image"], data[index]["title"],
//               data[index]["more_info"]["album"]);
