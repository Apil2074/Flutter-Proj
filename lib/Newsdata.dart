import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  _launchURL(String website) async {
    var links = '$website';
    if (await canLaunch(links)) {
      await launch(links);
    } else {
      throw "Couldn't Launch url";
    }
  }

// feilds
  String url;
  var response;
  var data;
  bool isLoading = true;

// future method -> api data -> response -> decode
  Future fetchData() async {
    url =
        "https://script.googleusercontent.com/macros/echo?user_content_key=nuvqshxEt9708hi_PdXw1jLwtEUYrE56NSvhK3M8lRAflVD5rPxQlXPXSK1Jh-ehRb6wGUcYBmQ9AwrP1OF02wQfCQXB2a4am5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnLZr6aVJeAc1mivENHtxZT__1ODR7oTLSIFZqr7JMXXMr9DZqE_JRBbkmBBTSsEKaGJcH2QKOfdIBbY2syYLHWn08HkqO4egqg&lib=MZpljCnu3WGqc7A-MJTrvIG_2HC8b9XOb";

    response = await http.get(url);

    setState(() {
      data = json.decode(response.body);
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agriculture News"),
      ),
      body: isLoading == true
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              shrinkWrap: true,
              // physics: NeverScrollableScrollPhysics(),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Image.network(data[index]['imglink']),
                      ListTile(
                        trailing: OutlinedButton(
                          onPressed: () {
                            _launchURL(data[index]['links']);
                          },
                          child: Text(
                            'Read More',
                            style: TextStyle(color: Colors.yellow[900]),
                          ),
                        ),
                        title: Text(
                          data[index]['title'],
                          style: TextStyle(fontSize: 18.0),
                        ),
                        subtitle: Text(data[index]['source']),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
