import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                              data[index]['commodity'],
                              style: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.bold),
                            ),
                            width: 100,
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            data[index]['unit'],
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
                          width: 50,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            data[index]['minimum'].toString(),
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
                          width: 80,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            data[index]['maximun'].toString(),
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
                          width: 70,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            data[index]['average'].toString(),
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
                          width: 70,
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
