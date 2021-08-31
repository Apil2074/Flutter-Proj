import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';-
import 'package:thiss/Mydrawer.dart';
import 'package:path_provider/path_provider.dart';

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  // int index;
  _genColor(int indeex) {
    if (indeex % 2 == 0) {
      return Colors.white;
    } else {
      return Colors.lightGreen[50];
    }
  }

  TextStyle topStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Colors.red,
  );
// feilds
  String url;
  var response;
  var data;
  bool isLoading = true;
  int nume = 1;

// future method -> api data -> response -> decode
  Future fetchData() async {
    await openBox();
    url =
        "https://script.googleusercontent.com/macros/echo?user_content_key=TsB3YVJGBAInJMs-HeB6SyXl6YsNgz1g59zXA3JMi1SsxKKrXclRcMCyI9RhM_m5c0CmuxWdfluBxAUEpHAh9jPTwlZ7s3kAm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnE1Av8rbHAP5lqO_PMTAoJ5nLBHdERFwr-jX_d2JYHyR1OP1wPuaOTfI53dfOJ8ei7TZr5pvvdaXn_kvQo7To2vnRfqXRCrqsA&lib=MBXAocAwLpwp6vlTdRzuJmm_2HC8b9XOb";
    response = await http.get(url);

    setState(() {
      data = json.decode(response.body);

      isLoading = false;
      putData(data);
    });

    var mymap = box.toMap().values.toList();
    if (mymap.isEmpty) {
      data.add('empty');
    } else {
      data = mymap;
    }
  }

  Box box;

  Future openBox() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    box = await Hive.openBox('data');
  }

  Future putData(data) async {
    await box.clear();
    for (var d in data) {
      box.add(d);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle botStyle = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        bottom: PreferredSize(
          child: Container(
            color: Colors.blue[200],
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Container(
                      width: 90,
                      child: Text(
                        "Station",
                        style: topStyle,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      "Maximum",
                      style: topStyle,
                    ),
                  ),
                  Container(
                    child: Text(
                      "Minimum",
                      style: topStyle,
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 18.0),
                      child: Text(
                        "Rainfall",
                        style: topStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          preferredSize: Size(30, 20),
        ),
        title: Text("Weather Update"),
      ),
      body: isLoading == true
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: data.length - 1,
              itemBuilder: (context, index) {
                return Card(
                  color: _genColor(index),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 100,
                          child: Text(
                            data[index]['station'],
                            style: botStyle,
                          ),
                        ),
                        Container(
                          // width: MediaQuery.of(context).size.width * 0.22,
                          width: 60,

                          child: Text(
                            data[index]['maximumTemp'].toString(),
                            style: botStyle,
                          ),
                          // width: 50,
                        ),
                        Container(
                          width: 50,

                          // width: MediaQuery.of(context).size.width * 0.22,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            data[index]['minimumTemperature'].toString(),
                            style: botStyle,
                          ),
                          // width: 60,
                        ),
                        Container(
                          // width: 0,

                          // width: MediaQuery.of(context).size.width * 0.22,

                          // alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text(
                              data[index]['rainfall'].toString(),
                              style: botStyle,
                            ),
                          ),
                          width: 50,
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
