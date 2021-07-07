import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NepsePage extends StatefulWidget {
  @override
  NepsePageState createState() => NepsePageState();
}

class NepsePageState extends State<NepsePage> {
  Color _genColor(num websitey) {
    if (websitey >= 0) {
      return Colors.green;
    } else {
      return Colors.red;
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

// future method -> api data -> response -> decode
  Future fetchData() async {
    url =
        "https://script.googleusercontent.com/macros/echo?user_content_key=--wRDwnZG_2QhEhbCXIHOeU9meVxlc0gSvwjtxwrSmwz6mv24YIGM1hLjLQAW6k2JrRDAEt8p6x7v3wsaNZfC7MR0U8_0Naem5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnHU4Uq_5UPHL8yGiyF09dkj5sqt9_qlcB5VOMD9UP7tJTbKprB3MXbD7fY36rtqZlafneVCrUKHtWTv9-JQJo5aQe_wdodf5Sg&lib=MosiUpOaTzmWZJVzgA2PlSW_2HC8b9XOb";

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
        title: Text("Today's Stock Price"),
        bottom: PreferredSize(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Symbol",
                    style: topStyle,
                  ),
                  Text(
                    "Closing Price",
                    style: topStyle,
                  ),
                  Text(
                    "% Change",
                    style: topStyle,
                  ),
                  Text(
                    "Max Price",
                    style: topStyle,
                  ),
                  Text(
                    "Min Price",
                    style: topStyle,
                  ),
                  Text(
                    "Opening Price",
                    style: topStyle,
                  ),
                ],
              ),
            ),
          ),
          preferredSize: Size(30, 20),
        ),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 70,
                          child: Text(
                            data[index]['symbol'],
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            data[index]['closing'].toString(),
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
                          width: 70,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            data[index]['pchange'].toString(),
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: _genColor(data[index]['pchange']),
                            ),
                          ),
                          width: 55,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            data[index]['max'].toString(),
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
                          width: 80,
                        ),
                        Container(
                          child: Text(
                            data[index]['min'].toString(),
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
                          width: 55,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              data[index]['open'].toString(),
                              style: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.bold),
                            ),
                            width: 60,
                          ),
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
