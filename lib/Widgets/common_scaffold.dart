
import 'package:flutter/material.dart';

class CommonScaffold extends StatelessWidget {
  const CommonScaffold({
    super.key, required this.body, this.appBar,
  });

  final Widget body;
  final AppBar? appBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar ?? AppBar(),
      body: body
    );
  }
}