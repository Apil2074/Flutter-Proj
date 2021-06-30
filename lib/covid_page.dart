import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CovidPage extends StatefulWidget {
  @override
  _CovidPageState createState() => _CovidPageState();
}

class _CovidPageState extends State<CovidPage> {
  var textStylep = TextStyle(
      fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.bold);
// feilds
  String url;
  var response;
  var data;
  bool isLoading = true;

// future method -> api data -> response -> decode
  Future fetchData() async {
    url = "https://covid19.mohp.gov.np/covid/api/confirmedcases";
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
        // botto?,
        title: Text("COVID STATUS"),
      ),
      body: isLoading == true
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      "Nepal Data",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      'Updated at: ' + data['global']['updated_at'],
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 33,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 60,
                            color: Colors.redAccent,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Toaday's Death",
                                  style: textStylep,
                                ),
                                Text(
                                  data['nepal']['today_death'],
                                  style: textStylep,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 33,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: Colors.yellow,
                            height: 60,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'New Cases',
                                  style: textStylep,
                                ),
                                Text(
                                  data['nepal']['today_newcase'],
                                  style: textStylep,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 33,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 60,
                            color: Colors.amber,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Positive Test",
                                  style: textStylep,
                                ),
                                Text(
                                  data['nepal']['positive'],
                                  style: textStylep,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 33,
                        child: Container(
                          height: 60,
                          color: Colors.yellow,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Total Positive',
                                style: textStylep,
                              ),
                              Text(
                                data['nepal']['positive'],
                                style: textStylep,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 33,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: Colors.yellow,
                            height: 60,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Total Negative",
                                  style: textStylep,
                                ),
                                Text(
                                  data['nepal']['negative'],
                                  style: textStylep,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 33,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: Colors.red[200],
                            height: 60,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Total Death",
                                  style: textStylep,
                                ),
                                Text(
                                  data['nepal']['deaths'],
                                  style: textStylep,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 33,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 60,
                            color: Colors.redAccent,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Toaday's Death",
                                  style: textStylep,
                                ),
                                Text(
                                  data['nepal']['today_death'],
                                  style: textStylep,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 33,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: Colors.yellow,
                            height: 60,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'New Cases',
                                  style: textStylep,
                                ),
                                Text(
                                  data['nepal']['today_newcase'],
                                  style: textStylep,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 33,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 60,
                            color: Colors.amber,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Positive Test",
                                  style: textStylep,
                                ),
                                Text(
                                  data['nepal']['positive'],
                                  style: textStylep,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    title: Text(
                      "World Data",
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      "Updated at:  " + data['global']['positive'],
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 27,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 60,
                            color: Colors.red[100],
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Total Positive',
                                  style: textStylep,
                                ),
                                Text(
                                  data['global']['positive'],
                                  style: textStylep,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 27,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 60,
                            color: Colors.teal,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Total Negative",
                                  style: textStylep,
                                ),
                                Text(
                                  data['global']['deaths'],
                                  style: textStylep,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 27,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            alignment: Alignment.center,
                            height: 60,
                            color: Colors.amber,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Total Death",
                                  style: textStylep,
                                ),
                                Text(
                                  data['global']['deaths'],
                                  style: textStylep,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
