import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CovidPage extends StatefulWidget {
  @override
  _CovidPageState createState() => _CovidPageState();
}

class _CovidPageState extends State<CovidPage> {
  var textStylep = TextStyle(
    fontSize: 13.0,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
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
        backgroundColor: Colors.red,
        // botto?,
        title: Text("COVID-19 STATUS"),
      ),
      body: isLoading == true
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.coronavirus_rounded,
                      color: Colors.blue,
                    ),
                    title: Text(
                      "Nepal Data",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      'Updated at: ' + data['nepal']['updated_at'],
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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
                            color: Colors.red[200],
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Text(
                                    "Toaday's Death",
                                    style: textStylep,
                                  ),
                                ),
                                Text(
                                  data['nepal']['today_death'],
                                  overflow: TextOverflow.clip,
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
                            color: Colors.yellow[300],
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
                            color: Colors.amber[200],
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Today Recovered",
                                  style: textStylep,
                                ),
                                Text(
                                  data['nepal']['today_recovered'],
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
                          color: Colors.yellow[200],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Today PCR Test',
                                style: textStylep,
                              ),
                              Text(
                                data['nepal']['today_pcr'],
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
                            color: Colors.yellow[200],
                            height: 60,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Today RDT Test",
                                  style: textStylep,
                                ),
                                Text(
                                  data['nepal']['today_rdt'],
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
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 33,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 60,
                            color: Colors.green[100],
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Total Tests",
                                  style: textStylep,
                                ),
                                Text(
                                  data['nepal']['samples_tested'],
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
                            color: Colors.yellow[100],
                            height: 60,
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
                      ),
                      Expanded(
                        flex: 33,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 60,
                            color: Colors.amber[100],
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Negative Test",
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
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ListTile(
                    tileColor: Colors.red[200],
                    leading: Icon(Icons.coronavirus),
                    title: Text(
                      "Symptoms of Covid-19",
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "Difficulty breathing or shortness of breath",
                          style: textStylep,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "Fever, DryCough, Tiredness",
                          style: textStylep,
                        )
                      ],
                    ),
                  ),
                  ListTile(
                    tileColor: Colors.amberAccent,
                    title: Text(
                      'What to do?',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Flexible(
                          child: Text(
                            "Seek immediate medical attention if you have serious symptoms.",
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "Always call before visiting your doctor or health facility.",
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Flexible(
                          child: Text(
                            "People with mild symptoms who are otherwise healthy shouldmanage their  symptoms at home",
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "On average it takes 5–6 days from when someone is infected \nwith the virus for symptoms to show,  it can take up to 14 days.",
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
