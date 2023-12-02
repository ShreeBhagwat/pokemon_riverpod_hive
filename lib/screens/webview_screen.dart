import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewScreen extends StatefulWidget {
  const WebviewScreen({super.key, required this.url});
  final String url;

  @override
  State<WebviewScreen> createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {
  late WebViewController _controller;
  int webProgress = 0;
  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.black)
      ..setNavigationDelegate(
        NavigationDelegate(
            onProgress: (int progress) {
              setState(() {
                webProgress = progress;
              });
            },
            onPageStarted: (String url) {
              setState(() {
                webProgress = 0;
              });
            },
            onPageFinished: (String url) {
              setState(() {
                webProgress = 100;
              });
            },
            onWebResourceError: (error) {
              log(error.description);
            },
            onUrlChange: (value) {},
            onNavigationRequest: (request) {
              log(request.url.toString());

              if (request.url
                  .toString()
                  .contains('https://www.google.com/search')) {
                return NavigationDecision.prevent;
              } else {
                return NavigationDecision.navigate;
              }
            }),
      )
      ..loadRequest(Uri.parse(widget.url), headers: {
        'User-Agent':
            'Mozilla/5.0 (Linux; Android 10; SM-G975F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Mobile Safari/537.36'
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          webProgress < 100
              ? const LinearProgressIndicator(
                  minHeight: 5,
                  color: Colors.red,
                )
              : const SizedBox.shrink(),
          Expanded(
            child: WebViewWidget(
              controller: _controller,
            ),
          ),
        ],
      ),
    );
  }
}
