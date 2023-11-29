import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_riverpod/modal/pokemon.dart';
import 'package:pokemon_riverpod/repository/pokemon_repo.dart';

final pokemonFutureProvider = FutureProvider.autoDispose<List<Pokemon>>((ref) {
  final pokemonrepo = ref.watch(pokemonRepoProvider);
  return pokemonrepo.getAllPokemon();
});

