import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:pokemon_riverpod/modal/pokemon.dart';

class HiveRepository {
  static const String POKEMON_BOX = 'pokemon_box';

  static registerHiveAdapters() {
    Hive.registerAdapter(PokemonAdapter());
  }

  Future<void> addPokemon(Pokemon pokemon) async {
    final pokemonbox = await Hive.openBox(POKEMON_BOX);
    await pokemonbox.add(pokemon).catchError((e) {
      log('Error adding pokemon to box $e');
    }).then((value) {
      log('Pokemon added to box');
    });
  }

  Future<List<Pokemon>> getAllPokemon() async {
    final pokemonbox = await Hive.openBox(POKEMON_BOX);
    final List<Pokemon> pokemonList =
        pokemonbox.values.toList().cast<Pokemon>();

    log('Pokemon list from box $pokemonList');
    return pokemonList;
  }

  Future<Pokemon> getPokemon(Pokemon pokemon) async {
    final pokemonbox = await Hive.openBox(POKEMON_BOX);
    final Pokemon pokemon = pokemonbox.getAt(1);
    return pokemon;
  }

  Future hiveDatabase() async {
    final box = await Hive.openBox(POKEMON_BOX);
    box.put('key', true);
  }

}
