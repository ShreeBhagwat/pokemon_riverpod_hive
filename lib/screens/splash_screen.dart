import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_riverpod/extensions/buildcontext_extensions.dart';
import 'package:pokemon_riverpod/providers/pokemon_provider.dart';
import 'package:pokemon_riverpod/repository/pokemon_repo.dart';
import 'package:pokemon_riverpod/screens/all_pokemon_screen.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500))
      ..repeat();

    Future.microtask(() async {
      fetchPokemonList();
      ref.read(pokemonProvider).getAllPokemonFromDatabase();
    });
  }

  void fetchPokemonList() async {
    await ref.read(pokemonProvider).getAllPokemon().then((value) {
      context.navigateToScreen(screen: const AllPokemonScreen(), replace: true);
    }).catchError((e) {
      log('Error fetching Pokemon list!, try again $e');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Transform(
                transform: Matrix4.identity()
                  ..translate(0.0, -_animationController.value * 100)
                  ..scale(1.0 - _animationController.value),
                alignment: Alignment.center,
                child: Transform.rotate(
                  angle: _animationController.value * 2 * 3.14,
                  child: Image.asset(
                    'images/pokeball_image.png',
                    height: 70,
                    width: 70,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
