import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

class wwbViewScreen extends StatelessWidget {
  final String url;
  wwbViewScreen(this.url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebView(initialUrl: url),
    );
  }
}
