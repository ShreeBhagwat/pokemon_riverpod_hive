import 'package:flutter/material.dart';
import 'package:pokemon_riverpod/screens/all_pokemon_screen.dart';

extension BuildContextExtension on BuildContext {
  void navigateToScreen({required Widget screen, bool replace = false}) {
    if (replace) {
      Navigator.of(this).pushAndRemoveUntil(
          PageRouteBuilder(
              pageBuilder: (_, __, ___) => screen,
              transitionDuration: const Duration(seconds: 1),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      FadeTransition(opacity: animation, child: child)),
          (route) => false);
    } else {
      Navigator.of(this).push(
        PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) => screen,
            transitionDuration: const Duration(seconds: 1),
            reverseTransitionDuration: const Duration(seconds: 1),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(opacity: animation, child: child)),
      );
    }
  }

  double getWidth({double percentage = 1.0}) {
    return MediaQuery.of(this).size.width * percentage;
  }
}
