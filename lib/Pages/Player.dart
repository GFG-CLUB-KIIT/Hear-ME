import 'package:flutter/material.dart';
import 'dart:ui';
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
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
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
                ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
              },
              blendMode: BlendMode.dstIn,
              child: Image.asset(
                'Assets/Images/monsters-go-bump.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
                child: new Container(
                  height: double.infinity,
                  decoration: new BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                  ),
                ),
              ),
            ),
          ),
          Scaffold(
            // backgroundColor: Color.fromRGBO(9, 18, 39, 1),
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text("Playing now"),
            ),
            body: Container(
                child: ListView(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Center(
                      child: Container(
                        height: 180,
                        width: 180,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100.0),
                          child: Image.asset(
                            'Assets/Images/monsters-go-bump.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        height: 300,
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
                SizedBox(height: 50),
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
                  margin: EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: playControl(MainAxisAlignment.center),
                ),
              ],
            )),
          ),
        ],
      ),
    );
  }
}
