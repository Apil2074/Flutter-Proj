import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'dart:convert';
// import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Loksewa extends StatefulWidget {
  // const Loksewa({Key key}) : super(key: key);

  @override
  _LoksewaState createState() => _LoksewaState();
}

// WebViewController _controller;

class _LoksewaState extends State<Loksewa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lok-Sewa Model Question")
          // pTreferredSize: const Size.fromHeight(60),
          // child: Container(
          //   color: Colors.red,
          // ),
          ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: SfPdfViewer.asset('assets/loksewa.pdf'),
            ),
            Container(
              child: SfPdfViewer.asset('assets/loksewa2.pdf'),
            ),
          ],
        ),
      ),
    );
  }
}

// _loadCucumber() async {
//   String fileText = await rootBundle.loadString('assets/loksewa.html');
//   _controller.loadUrl(
//     Uri.dataFromString(
//       fileText,
//       mimeType: 'text/html',
//       encoding: Encoding.getByName('utf-8'),
//     ).toString(),
//   );

