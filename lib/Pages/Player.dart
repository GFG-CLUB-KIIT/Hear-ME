import 'package:flutter/material.dart';
import 'package:flutter_circular_slider/flutter_circular_slider.dart';
import '../Widgets/playControl.dart';

class Player extends StatelessWidget {
  LinearGradient gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Colors.indigo.withOpacity(0.6), Colors.black]);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(9, 18, 39, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text("Playing now"),
      ),
      body: Container(
          child: ListView(
        children: [
          // TODO:Music List Images;

          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 300,
                child: Image.asset(
                  'Assets/Images/monsters-go-bump.jpg',
                  fit: BoxFit.fitWidth,
                ),
              ),
              Container(
                width: double.infinity,
                height: 300,
                color: Colors.black.withOpacity(0.7),
              ),
              Center(
                child: Container(
                  height: 180,
                  width: 180,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(1000.0),
                    child: Image.asset(
                      'Assets/Images/monsters-go-bump.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  child: Center(
                    child: SingleCircularSlider(
                      100,
                      50,
                      baseColor: Colors.white.withOpacity(0.3),
                      selectionColor: Colors.blue,
                      handlerColor: Colors.white,
                      handlerOutterRadius: 8.0,
                      secondarySectors: 10,
                      sliderStrokeWidth: 3.0,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                right: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("00:50"),
                    Text("04:50"),
                  ],
                ),
              ),
            ],
          ),

          ListTile(
            leading: Icon(Icons.thumb_up_outlined),
            title: Center(child: Text("Monsters Go Bump")),
            subtitle: Center(child: Text("ERIKA RECINOS")),
            trailing: Icon(Icons.thumb_down_outlined),
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: IconButton(
                  icon: Icon(Icons.loop),
                  iconSize: 30,
                  color: Colors.blue,
                  onPressed: () {},
                ),
                decoration: BoxDecoration(
                  gradient: gradient,
                  borderRadius: BorderRadius.all(
                    Radius.circular(100),
                  ),
                ),
              ),
              SizedBox(
                width: 200,
              ),
              Container(
                child: IconButton(
                  icon: Icon(Icons.shuffle),
                  iconSize: 30,
                  color: Colors.white,
                  onPressed: () {},
                ),
                decoration: BoxDecoration(
                  gradient: gradient,
                  borderRadius: BorderRadius.all(
                    Radius.circular(100),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: playControl(MainAxisAlignment.center),
          ),
        ],
      )),
    );
  }
}
