import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key key}) : super(key: key);
  _launchURl(String link) async {
    var linkes = '$link';
    if (await canLaunch(linkes)) {
      await launch(linkes);
    } else {
      throw "Couldn't Launch url";
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle thisss = TextStyle(
      fontSize: 18.0,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("About us"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                child: Text(
                  "COBRA",
                  style: TextStyle(fontSize: 24),
                ),
                radius: 70,
                backgroundColor: Colors.purple,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "This app is developed as a fun project durning Lockdown 2.0, There have been lots of changes in the UI (User Interface ). There will be more updates in coming days. We will try to push updates in coming days.",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Contributors:",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/bharat.jpg"),
                    ),
                    title: Text(
                      "Bharat Acharya",
                      style: thisss,
                    ),
                    onTap: () {
                      _launchURl("https://www.facebook.com/bharat.achary.1");
                    },
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/amit.jpg"),
                    ),
                    title: Text(
                      "Amit Jha",
                      style: thisss,
                    ),
                    onTap: () {
                      _launchURl(
                          "https://www.facebook.com/profile.php?id=100005368566693");
                    },
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/ajit.jpg"),
                    ),
                    title: Text(
                      "Ajit Yadav",
                      style: thisss,
                    ),
                    onTap: () {
                      _launchURl(
                          "https://www.facebook.com/profile.php?id=100018115568157");
                    },
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/bisu.jpg"),
                    ),
                    title: Text(
                      "Bismark Gautam",
                      style: thisss,
                    ),
                    onTap: () {
                      _launchURl('https://www.facebook.com/bismark.gautam');
                    },
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/susu.jpg"),
                    ),
                    title: Text(
                      "Sushant Ghimire",
                      style: thisss,
                    ),
                    onTap: () {
                      _launchURl(
                          "https://www.facebook.com/sushant.ghimire.1675");
                    },
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/sakil.jpg"),
                    ),
                    title: Text(
                      "Sakil Ansari",
                      style: thisss,
                    ),
                    onTap: () {
                      _launchURl("https://www.facebook.com/sakil.ansari.982");
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
