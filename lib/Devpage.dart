import 'package:flutter/material.dart';

class DevPage extends StatelessWidget {
  const DevPage({Key key}) : super(key: key);

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
          ListTile(
            title: Text("visist developer SIte"),
          )
        ],
      ),
    );
  }
}
