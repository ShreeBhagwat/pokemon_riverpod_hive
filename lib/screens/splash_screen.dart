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

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      fetchPokemonList();
      ref.read(pokemonProvider).getAllPokemonFromDatabase();
    });
  }

  void fetchPokemonList() async {
    await ref.read(pokemonProvider).getAllPokemon().then((value) {
      context.navigateToScreen(screen: const AllPokemonScreen());
    }).catchError((e) {
      log('Error fetching Pokemon list!, try again $e');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SizedBox(
          height: 50,
          width: 50,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
