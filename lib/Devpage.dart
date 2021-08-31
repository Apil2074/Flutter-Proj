import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DevPage extends StatelessWidget {
  static const TextStyle stylethis = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );
  const DevPage({Key key}) : super(key: key);

  _launchURl(String website) async {
    var links = '$website';
    if (await canLaunch(links)) {
      await launch(links);
    } else {
      throw "Couldn't Launch url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Developer Info"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 60.0,
            backgroundImage: AssetImage("assets/dev.jpg"),
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            "Apil Subedi",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            "Tech Enthusiast",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Text(
                'Apil Subedi is a tech enthusiast person have been involved in ICT sector for more than 5 years. During this time he have learned many technologies and langauges. Python JavaScript and Dart are the major programming that he loves',
                style: TextStyle(
                  fontSize: 18,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    IconButton(
                        iconSize: 40,
                        icon: Icon(
                          Icons.facebook,
                          color: Colors.blue[900],
                        ),
                        onPressed: () {
                          _launchURl("https://www.facebook.com/aapil.subedi.1");
                        }),
                    Text(
                      'Facebook',
                      style: stylethis,
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      iconSize: 40,
                      icon: FaIcon(
                        FontAwesomeIcons.twitter,
                        color: Colors.blue[400],
                      ),
                      onPressed: () {
                        _launchURl("https://twitter.com/Apeelsubedi2");
                      },
                    ),
                    Text(
                      'Twitter',
                      style: stylethis,
                    )
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                        iconSize: 40,
                        icon: FaIcon(FontAwesomeIcons.github),
                        onPressed: () {
                          _launchURl("https://github.com/Apil2074");
                        }),
                    Text(
                      "Git Hub",
                      style: stylethis,
                    )
                  ],
                ),
                // Column(),
                // Column(),
                // Column(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
