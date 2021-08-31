import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:thiss/provider/google_sign_in.dart';
// import 'package:google_sign_in/google_sign_in.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(user.photoURL),
                  radius: 40.0,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  user.displayName,
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 5),
                Text(
                  user.email,
                  style: TextStyle(color: Colors.white),
                ),
                // ElevatedButton(
                //   onPressed: () {
                //     final provider = Provider.of<GoogleSignInProvider>(context,
                //         listen: false);
                //     provider.logout();
                //   },
                //   child: Text('Logout'),
                // )
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.blue[900],
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
              leading: Icon(Icons.food_bank)),
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
              Navigator.pushNamed(context, '/agriculture');
            },
            title: Text("Agriculture"),
            leading: Icon(Icons.info),
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
              Navigator.pushNamed(context, '/loksewa');
            },
            title: Text("LokSewa Capsule"),
            leading: Icon(Icons.book_online),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/aboutus');
            },
            title: Text("About us"),
            leading: Icon(Icons.info_outline_sharp),
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
