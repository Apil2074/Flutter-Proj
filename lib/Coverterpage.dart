// ignore: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';

class Converter extends StatelessWidget {
  const Converter({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Land Unit Converter"),
      ),
      body: ConvertPage(),
    );
  }
}

class ConvertPage extends StatefulWidget {
  @override
  _ConvertPageState createState() => _ConvertPageState();
}

class _ConvertPageState extends State<ConvertPage> {
  final TextStyle labelStyle = TextStyle(
    fontSize: 16.0,
  );
  final TextStyle resultSyle = TextStyle(
    color: Colors.red,
    fontSize: 25.0,
    fontWeight: FontWeight.w700,
  );

  final List<String> _mesaures = [
    'Bigha',
    'Kattha',
    'Ropani',
    'Dhur',
    'Aana',
    'Paisa',
    'Daam'
  ];

  double _value;
  String _fromMesaures = 'Bigha';
  String _toMesaures = 'Kattha';
  String _results = "";

  final Map<String, int> _mesauresMap = {
    'Bigha': 0,
    'Kattha': 1,
    'Ropani': 2,
    'Dhur': 3,
    'Aana': 4,
    'Paisa': 5,
    'Daam': 6,
  };
  dynamic _formulas = {
    '0': [1, 20, 13.31, 400, 213.0022, 851.8400, 3407.3600],
    '1': [0.0500, 1, 0.6655, 20, 10.65501, 42.5920, 170.3680],
    '2': [0.0751, 1.5026, 1, 30.0526, 16.0032, 64.65501, 256],
    '3': [0.0025, 0.0500, 0.0333, 1, 0.5325, 2.1296, 8.5184],
    '4': [0.0047, 0.0939, 0.0625, 1.8779, 1, 3.9992, 15.9968],
    '5': [0.0012, 0.0235, 0.0156, 0.4696, 0.2500, 1, 4],
    '6': [0.0003, 0.0059, 0.0039, 0.1174, 0.0625, 0.2500, 1]
  };

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter the Value',
              ),
              onChanged: (value) {
                setState(() {
                  _value = double.parse(value);
                });
              },
            ),
            SizedBox(height: 25.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'From',
                      style: labelStyle,
                    ),
                    DropdownButton(
                      items: _mesaures
                          .map((String value) => DropdownMenuItem<String>(
                                child: Text(value),
                                value: value,
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _fromMesaures = value.toString();
                        });
                      },
                      value: _fromMesaures,
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('To', style: labelStyle),
                    DropdownButton(
                      items: _mesaures
                          .map((String value) => DropdownMenuItem<String>(
                                child: Text(value),
                                value: value,
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _toMesaures = value.toString();
                        });
                      },
                      value: _toMesaures,
                    )
                  ],
                ),
              ],
            ),
            MaterialButton(
              minWidth: double.infinity,
              onPressed: _convert,
              child: Text(
                'Convert',
                style: TextStyle(color: Colors.white),
              ),
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(height: 25.0),
            Text(
              _results,
              style: resultSyle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  void _convert() {
    print('Button Clicked');
    print(_value);

    if (_value != 0 && _fromMesaures.isNotEmpty && _toMesaures.isNotEmpty) {
      int from = _mesauresMap[_fromMesaures];
      int to = _mesauresMap[_toMesaures];

      var multiplier = _formulas[from.toString()][to];

      setState(() {
        _results =
            "$_value $_fromMesaures = ${_value * multiplier} $_toMesaures";
      });
    } else {
      setState(() {
        _results = "Please enter a Non-Zero Value";
      });
    }
  }
}
