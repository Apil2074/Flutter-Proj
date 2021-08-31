import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  // https://script.googleusercontent.com/macros/echo?user_content_key=Pjz-x9OzK-ngLPsL1aPu82nL_UVSwU_tI_102Sm5lreqtvgBI1E9Jv7RFr156NJUt_V95CbM59GBxAUEpHAh9mtDPLc0UArlm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnPJwHFeySB5km4dKeSKaycA4dGxSqvkOgXlRTP4M9HL-RqyVb7A58pt2xzrQCnF_EHkOIhvrlj80eK3azzgFwIFAHa7lkDWJvw&lib=MCDm9COUPCaHwSix82Zi4QG_2HC8b9XOb

// future method -> api data -> response -> decode
  Future fetchData() async {
    url =
        "https://script.googleusercontent.com/macros/echo?user_content_key=Pjz-x9OzK-ngLPsL1aPu82nL_UVSwU_tI_102Sm5lreqtvgBI1E9Jv7RFr156NJUt_V95CbM59GBxAUEpHAh9mtDPLc0UArlm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnPJwHFeySB5km4dKeSKaycA4dGxSqvkOgXlRTP4M9HL-RqyVb7A58pt2xzrQCnF_EHkOIhvrlj80eK3azzgFwIFAHa7lkDWJvw&lib=MCDm9COUPCaHwSix82Zi4QG_2HC8b9XOb";

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
        title: Text("Today's Vegetable Rate"),
        bottom: PreferredSize(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 120,
                    child: Text(
                      "Commodity",
                      style: topStyle,
                    ),
                  ),
                  Text(
                    "Unit",
                    style: topStyle,
                  ),
                  Text(
                    "Maximun",
                    style: topStyle,
                  ),
                  Text(
                    "Minimum",
                    style: topStyle,
                  ),
                  Text(
                    "Average",
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
                  color: _genColor(index),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.topLeft,
                          width: 130,
                          child: Text(
                            data[index]['commodity'],
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,

                          width: 40,
                          // alignment: Alignment.topRight,
                          child: Text(
                            data[index]['unit'],
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          width: 40,
                          child: Text(
                            data[index]['minimum'].toString(),
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          width: 40,
                          child: Text(
                            data[index]['maximun'].toString(),
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topCenter,
                          width: 50,
                          child: Text(
                            data[index]['average'].toString(),
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
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
