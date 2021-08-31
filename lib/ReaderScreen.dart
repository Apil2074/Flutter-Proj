import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ReaderScreen extends StatefulWidget {
  final String listss;
  ReaderScreen(this.listss);

  @override
  _ReaderScreenState createState() => _ReaderScreenState();
}

WebViewController _controller;

class _ReaderScreenState extends State<ReaderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.listss),
      ),
      body: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: 'about:blank',
          onWebViewCreated: (WebViewController webviewController) {
            _controller = webviewController;
            if (widget.listss == 'Cucumber')
              _loadCucumber();
            else if (widget.listss == 'Carrot')
              _loadCarrot();
            else if (widget.listss == 'Mango')
              _loadMango();
            else if (widget.listss == 'Litchi')
              _loadLitchi();
            else if (widget.listss == 'Pomegenerate')
              _loadPomegenerate();
            else if (widget.listss == 'Dragon Fruit')
              _loadDragon();
            else if (widget.listss == 'JackFruit')
              _loadJackFruit();
            else if (widget.listss == 'PineApple') _loadPineApple();
          }),
    );
  }
}

_loadCucumber() async {
  String fileText = await rootBundle.loadString('assets/cucumber.html');
  _controller.loadUrl(
    Uri.dataFromString(
      fileText,
      mimeType: 'text/html',
      encoding: Encoding.getByName('utf-8'),
    ).toString(),
  );
}

_loadCarrot() async {
  String fileText = await rootBundle.loadString('assets/carrot.html');
  _controller.loadUrl(
    Uri.dataFromString(
      fileText,
      mimeType: 'text/html',
      encoding: Encoding.getByName('utf-8'),
    ).toString(),
  );
}

_loadMango() async {
  String fileText = await rootBundle.loadString('assets/mango.html');
  _controller.loadUrl(
    Uri.dataFromString(
      fileText,
      mimeType: 'text/html',
      encoding: Encoding.getByName('utf-8'),
    ).toString(),
  );
}

_loadLitchi() async {
  String fileText = await rootBundle.loadString('assets/litchi.html');
  _controller.loadUrl(
    Uri.dataFromString(
      fileText,
      mimeType: 'text/html',
      encoding: Encoding.getByName('utf-8'),
    ).toString(),
  );
}

_loadPomegenerate()  async {
  String fileText = await rootBundle.loadString('assets/pome.html');
  _controller.loadUrl(
    Uri.dataFromString(
      fileText,
      mimeType: 'text/html',
      encoding: Encoding.getByName('utf-8'),
    ).toString(),
  );
}

_loadJackFruit() async {
  String fileText = await rootBundle.loadString('assets/jack.html');
  _controller.loadUrl(
    Uri.dataFromString(
      fileText,
      mimeType: 'text/html',
      encoding: Encoding.getByName('utf-8'),
    ).toString(),
  );
}

_loadDragon() async {
  String fileText = await rootBundle.loadString('assets/drag.html');
  _controller.loadUrl(
    Uri.dataFromString(
      fileText,
      mimeType: 'text/html',
      encoding: Encoding.getByName('utf-8'),
    ).toString(),
  );
}

_loadPineApple() async {
  String fileText = await rootBundle.loadString('assets/pineapple.html');
  _controller.loadUrl(
    Uri.dataFromString(
      fileText,
      mimeType: 'text/html',
      encoding: Encoding.getByName('utf-8'),
    ).toString(),
  );
}
