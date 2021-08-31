import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfPage extends StatelessWidget {
  // const PdfPage({ Key? key }) : super(key: key);
  final String title;
  PdfPage(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (title == "Papaya") ...[
              Container(child: SfPdfViewer.asset("assets/papaya.pdf")),
            ] else if (title == "Pine Apple") ...[
              Container(
                child: SfPdfViewer.asset('assets/pine.pdf'),
              ),
            ] else if (title == "Pine Apple") ...[
              Container(
                child: SfPdfViewer.asset('assets/loksewa.pdf'),
              ),
            ] else if (title == "Pine Apple") ...[
              Container(
                child: SfPdfViewer.asset('assets/loksewa.pdf'),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
