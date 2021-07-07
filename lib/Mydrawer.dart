import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://pbs.twimg.com/media/DiZguTqWkAEKBgS.jpg',
                  ),
                  radius: 40.0,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Apil Subedi",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 5),
                Text(
                  "PSCYOPATH",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.green,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/second');
            },
            title: Text("Weather Update"),
            leading: Icon(Icons.cloud),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/third');
            },
            title: Text("Kalimati Market Price"),
            leading: Icon(Icons.cloud),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/forth');
            },
            title: Text("Land Unit Converter"),
            leading: Icon(Icons.info),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/fifth');
            },
            title: Text("News"),
            leading: Icon(Icons.landscape),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/covid');
            },
            title: Text("COVID-19"),
            leading: Icon(Icons.coronavirus_rounded),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/sharebazar');
            },
            title: Text("Nepali Share Bazar"),
            leading: Icon(Icons.auto_graph),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/aboutus');
            },
            title: Text("About us"),
            leading: Icon(Icons.info),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/devops');
            },
            title: Text("Developer Info"),
            leading: Icon(Icons.info),
          ),
        ],
      ),
    );
  }
}
