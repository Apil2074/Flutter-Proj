import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
// feilds
  String url;
  var response;
  var data;
  bool isLoading = true;

// future method -> api data -> response -> decode
  Future fetchData() async {
    url =
        "https://script.googleusercontent.com/macros/echo?user_content_key=TsB3YVJGBAInJMs-HeB6SyXl6YsNgz1g59zXA3JMi1SsxKKrXclRcMCyI9RhM_m5c0CmuxWdfluBxAUEpHAh9jPTwlZ7s3kAm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnE1Av8rbHAP5lqO_PMTAoJ5nLBHdERFwr-jX_d2JYHyR1OP1wPuaOTfI53dfOJ8ei7TZr5pvvdaXn_kvQo7To2vnRfqXRCrqsA&lib=MBXAocAwLpwp6vlTdRzuJmm_2HC8b9XOb";
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
        title: Text("Weather Update"),
      ),
      body: isLoading == true
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            child: Text(
                              data[index]['station'],
                              style: TextStyle(fontSize: 13.0),
                            ),
                            width: 80,
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            data[index]['maximumTemp'].toString(),
                            style: TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                          width: 100,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            data[index]['minimumTemperature'].toString(),
                            style: TextStyle(fontSize: 14.0),
                          ),
                          width: 110,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            data[index]['rainfall'].toString(),
                            style: TextStyle(fontSize: 14.0),
                          ),
                          width: 80,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
