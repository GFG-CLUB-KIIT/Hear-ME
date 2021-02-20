import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Developers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(9, 18, 39, 1),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Developers",
          // shaderRect: Rect.fromLTWH(13.0, 0.0, 100.0, 50.0),
          // gradient: LinearGradient(
          //   colors: [
          //   Color(0xff4db6ac),
          //   Color(0xff61e88a),
          // ]
          // ),
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () => Navigator.pop(context, false),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(child: AboutCards()),
    );
  }
}

class AboutCards extends StatelessWidget {
  final List<Map<String, String>> data = [
    {
      'name': 'Alok Patel',
      'subtitle': 'Flutter Developer',
      'githubURL': 'https://github.com/1-alok',
      'instagramURL': 'https://instagram.com',
      'profileURL': 'https://bit.ly/2NBn2Qh',
    },
    {
      'name': 'Divyanshu Shekhar',
      'subtitle': 'Web & App Developer',
      'githubURL': 'https://github.com/divshekhar',
      'instagramURL': 'https://instagram.com',
      'profileURL':
          'https://divyanshushekhar.com/wp-content/uploads/2020/03/Divyanshu-Shekhar.png',
    },
    {
      'name': 'Ashish Mishra',
      'subtitle': 'Flutter Developer',
      'githubURL': 'https://github.com/ashishmishra-bit',
      'instagramURL': 'https://instagram.com',
      'profileURL': 'https://bit.ly/2M5qRNb',
    },
    {
      'name': 'Nitish Sonthalia',
      'subtitle': 'Android Developer',
      'githubURL': 'https://github.com/nks102000',
      'instagramURL': 'https://instagram.com',
      'profileURL': 'https://bit.ly/3qCPPCy',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 8, right: 8, bottom: 6),
          child: Column(
            children: <Widget>[
              ListTile(
                title: Image.asset(
                  "Assets/Images/Icons/logo.png",
                  fit: BoxFit.fitHeight,
                  height: 120,
                ),
                // title: Container(
                //   height: 120,
                //   child: FlutterLogo(),
                // ),
                subtitle: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Center(
                    child: Text(
                      "HearMe | 1.0.0",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0, left: 10, right: 10),
          child: Divider(
            color: Colors.white,
            thickness: 0.8,
          ),
        ),
        ...developerTile(data),
      ],
    );
  }

  void _launchURL(String url) async {
    print('Inside Launch URL: ' + url);
    if (await canLaunch(url)) {
      await launch(
        url,
        universalLinksOnly: true,
      );
    } else {
      throw 'There was a problem to open the url: $url';
    }
  }

  List<Padding> developerTile(List<Map<String, String>> data) {
    return (data.map(
      (entity) => Padding(
        padding: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 6),
        child: Card(
          color: Colors.indigo[900],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          elevation: 2.3,
          child: ListTile(
            leading: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(entity['profileURL']),
                ),
              ),
            ),
            title: Text(
              entity['name'],
            ),
            subtitle: Text(
              entity['subtitle'],
            ),
            trailing: Wrap(
              children: <Widget>[
                // Github Icon
                IconButton(
                  icon: Icon(
                    MdiIcons.github,
                  ),
                  tooltip: 'GitHub',
                  onPressed: () {
                    _launchURL(entity['githubURL']);
                    print(entity['githubURL']);
                  },
                ),
                // Instagram Icon
                IconButton(
                  icon: Icon(
                    MdiIcons.instagram,
                  ),
                  tooltip: 'Contact on Instagram',
                  onPressed: () {
                    _launchURL(entity['instagramURL']);
                    print(entity['instagramURL']);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    )).toList();
  }
}
