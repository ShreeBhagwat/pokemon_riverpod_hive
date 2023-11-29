import 'dart:developer';

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

  void showCustomSnackbar(
      {required String title,
      required String message,
      String? label,
      VoidCallback? onPressed,
      required MessageType messageType}) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      showCloseIcon: true,
      onVisible: () {
        log('Snackbar is visible');
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      dismissDirection: DismissDirection.vertical,
      elevation: 5,
      behavior: SnackBarBehavior.fixed,
      action: SnackBarAction(
          label: label ?? 'Trial', onPressed: onPressed ?? () {}),
      backgroundColor: Colors.grey.shade700,
      content: SizedBox(
        height: 50,
        child: Row(
          children: [
            const Icon(
              Icons.error_outline,
              color: Colors.white,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text(
                  message,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}

enum MessageType { success, error, warning, info }
