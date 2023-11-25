import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_riverpod/modal/pokemon.dart';
import 'package:pokemon_riverpod/repository/hive_repository.dart';
import 'package:pokemon_riverpod/repository/pokemon_repo.dart';

class PokemonProvider extends ChangeNotifier {
  final Ref ref;
  final HiveRepository _hiveRepository = HiveRepository();

  PokemonProvider({required this.ref});

  bool _isLoading = false;
  List<Pokemon> _allPokemons = [];
  List<Pokemon> _pokemonsFromDatabase = [];

  List<Pokemon> get allPokemons => _allPokemons;
  bool get isLoading => _isLoading;
  List<Pokemon> get pokemonsFromDatabase => _pokemonsFromDatabase;

  void setLoader(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> getAllPokemon() async {
    setLoader(true);
    ref.read(pokemonRepoProvider).getAllPokemon().then((value) {
      _allPokemons = value;
      log(_allPokemons.first.name.toString());
    }).catchError((e) {
      log('Error fetching Pokemon list!, try again $e');
    }).whenComplete(() {
      setLoader(false);
    });
  }

  Future addPokemonToDatabase(Pokemon pokemon) async {
    await _hiveRepository.addPokemon(pokemon);
  }

  Future getAllPokemonFromDatabase() async {
    await _hiveRepository.getAllPokemon().then((value) {
      _pokemonsFromDatabase = value;

      log('Pokemon list from box $_pokemonsFromDatabase');
    }).catchError((e) {
      log('Error fetching Pokemon list from box!, try again $e');
    }).whenComplete(() {
      notifyListeners();
    });
  }
}

final pokemonProvider = ChangeNotifierProvider<PokemonProvider>((ref) {
  return PokemonProvider(ref: ref);
});
