import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  void navigateToScreen({required Widget screen}) {
    Navigator.of(this).push(MaterialPageRoute(builder: (_) => screen));
  }

  double getWidth({double percentage = 1.0}) {
    return MediaQuery.of(this).size.width * percentage;
  }
}
