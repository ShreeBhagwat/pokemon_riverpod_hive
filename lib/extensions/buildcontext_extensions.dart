import 'package:flutter/material.dart';
import 'package:pokemon_riverpod/screens/all_pokemon_screen.dart';

extension BuildContextExtension on BuildContext {
  void navigateToScreen({required Widget screen, bool replace = false}) {
    if (replace) {
      Navigator.of(this).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const AllPokemonScreen()),
          (route) => false);
    } else {
      Navigator.of(this).push(MaterialPageRoute(builder: (_) => screen));
    }
  }

  double getWidth({double percentage = 1.0}) {
    return MediaQuery.of(this).size.width * percentage;
  }
}
