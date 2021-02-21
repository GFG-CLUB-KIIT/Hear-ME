import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:flutter_circular_slider/flutter_circular_slider.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:palette_generator/palette_generator.dart';
import '../Utils/audio_serviec.dart';

import '../Widgets/playControl.dart';
import '../Widgets/gradients.dart';

class Player extends StatefulWidget {
  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  Map<String, Color> color = {
    'lightColor': Colors.white,
    'darkColor': Colors.black,
    'dominantColor': Colors.indigo,
    'darkVibrantColor': Colors.indigo,
    'lightVibrantColor': Colors.indigo,
  };

  String imagePath = 'Assets/Images/tum-hi-ho.jpg';

  ImageProvider image = AssetImage('Assets/Images/tum-hi-ho.jpg');

  @override
  void initState() {
    super.initState();
    _updatePaletteColor();
  }

  void _updatePaletteColor() async {
    PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(
      image,
      size: Size(200, 100),
      maximumColorCount: 20,
    );
    setState(() {
      color['darkColor'] = paletteGenerator.darkMutedColor.color;
      color['lightColor'] = paletteGenerator.lightMutedColor.color;
      color['dominantColor'] = paletteGenerator.dominantColor.color;
      color['darkVibrantColor'] = paletteGenerator.darkVibrantColor.color;
      color['lightVibrantColor'] = paletteGenerator.lightVibrantColor.color;
    });
  }

  @override
  Widget build(BuildContext context) {
    final LinearGradient gradient = linearGradient(color);
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
                imagePath,
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
                physics: BouncingScrollPhysics(),
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
                              imagePath,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          height: 300,
                          child: Center(
                            child: StreamBuilder<Duration>(
                              stream: player.durationStream,
                              builder: (context, duration) {
                                return StreamBuilder<Duration>(
                                    stream: player.positionStream,
                                    builder: (context, position) {
                                      // double length = (position
                                      //             .data.inMilliseconds /
                                      //         duration.data.inMilliseconds) *
                                      //     100;
                                      // // print(length);
                                      // print(position.data.inSeconds);
                                      // print(position.data.inSeconds);
                                      return SingleCircularSlider(
                                        duration.data.inSeconds == null
                                            ? 1
                                            : duration.data.inSeconds,
                                        position.data.inSeconds == null
                                            ? 1
                                            : position.data.inSeconds,
                                        baseColor:
                                            Colors.white.withOpacity(0.3),
                                        selectionColor:
                                            color['lightVibrantColor'],
                                        handlerColor: Colors.white,
                                        handlerOutterRadius: 8.0,
                                        secondarySectors: 10,
                                        sliderStrokeWidth: 3.0,
                                      );
                                    });
                              },
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
                          color: color['darkColor'],
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
                          icon: GlowIcon(
                            Icons.shuffle,
                            glowColor: Colors.blue,
                            blurRadius: 20,
                          ),
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
                    child: playControl(MainAxisAlignment.center, color),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
