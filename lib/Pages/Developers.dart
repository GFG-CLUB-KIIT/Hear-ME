import 'package:flutter/material.dart';
// import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
// import 'package:Musify/helper/utils.dart';
// import 'package:Musify/style/appColors.dart';

class Developers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(9, 18, 39, 1),
      appBar: AppBar(
        // brightness: Brightness.dark,
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
            // color: accent,
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            // color: accent,
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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 8, right: 8, bottom: 6),
          child: Column(
            children: <Widget>[
              ListTile(
                // title: Image.asset(
                //   "Assets/Images/Icons/logo.png",
                //   height: 120,
                // ),
                title: Container(
                  height: 120,
                  child: FlutterLogo(),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Center(
                    child: Text(
                      "HearMe  | 1.0.0",
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
        Padding(
          padding: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 6),
          child: Card(
            color: Colors.indigo[900],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            elevation: 2.3,
            child: ListTile(
              leading: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage("https://bit.ly/2NBn2Qh"),
                  ),
                ),
              ),
              title: Text(
                'Alok Kumar Patel',
                // style: TextStyle(color: accentLight),
              ),
              subtitle: Text(
                'Flutter Developer',
                // style: TextStyle(color: accentLight),
              ),
              trailing: Wrap(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      MdiIcons.telegram,
                      // color: accentLight,
                    ),
                    tooltip: 'Contact on Telegram',
                    onPressed: () {
                      // launchURL("https://telegram.dog/harshv23");
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      MdiIcons.twitter,
                      // color: accentLight,
                    ),
                    tooltip: 'Contact on Twitter',
                    onPressed: () {
                      // launchURL("https://twitter.com/harshv23");
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 6),
          child: Card(
            color: Colors.indigo[900],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 2.3,
            child: ListTile(
              leading: Container(
                width: 50.0,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        "https://divyanshushekhar.com/wp-content/uploads/2020/03/Divyanshu-Shekhar.png"),
                  ),
                ),
              ),
              title: Text(
                'Divyanshu Shekhar',
                // style: TextStyle(color: accentLight),
              ),
              subtitle: Text(
                'Android Developer',
                // style: TextStyle(color: accentLight),
              ),
              trailing: Wrap(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      MdiIcons.telegram,
                      // color: accentLight,
                    ),
                    tooltip: 'Contact on Telegram',
                    onPressed: () {
                      // launchURL("https://telegram.dog/cyberboysumanjay");
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      MdiIcons.twitter,
                      // color: accentLight,
                    ),
                    tooltip: 'Contact on Twitter',
                    onPressed: () {
                      // launchURL("https://twitter.com/cyberboysj");
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 6),
          child: Card(
            color: Colors.indigo[900],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 2.3,
            child: ListTile(
              leading: Container(
                width: 50.0,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage("https://bit.ly/3qCPPCy"),
                  ),
                ),
              ),
              title: Text(
                'Nitish Kumar Sonthalia',
                // style: TextStyle(color: accentLight),
              ),
              subtitle: Text(
                'Android Developer',
                // style: TextStyle(color: accentLight),
              ),
              trailing: Wrap(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      MdiIcons.telegram,
                      // color: accentLight,
                    ),
                    tooltip: 'Contact on Telegram',
                    onPressed: () {
                      // launchURL("https://t.me/dhruvanbhalara");
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      MdiIcons.twitter,
                      // color: accentLight,
                    ),
                    tooltip: 'Contact on Twitter',
                    onPressed: () {
                      // launchURL("https://twitter.com/dhruvanbhalara");
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 6),
          child: Card(
            color: Colors.indigo[900],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 2.3,
            child: ListTile(
              leading: Container(
                width: 50.0,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage("https://bit.ly/2M5qRNb"),
                  ),
                ),
              ),
              title: Text(
                'Ashish Kumar Mishra',
                // style: TextStyle(color: accentLight),
              ),
              subtitle: Text(
                'Android Developer',
                // style: TextStyle(color: accentLight),
              ),
              trailing: Wrap(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      MdiIcons.telegram,
                      // color: accentLight,
                    ),
                    tooltip: 'Contact on Telegram',
                    onPressed: () {
                      // launchURL("https://telegram.dog/kapiljhajhria");
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      MdiIcons.twitter,
                      // color: accentLight,
                    ),
                    tooltip: 'Contact on Twitter',
                    onPressed: () {
                      // launchURL("https://twitter.com/kapiljhajhria");
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
