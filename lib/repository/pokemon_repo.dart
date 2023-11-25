import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_riverpod/modal/pokemon.dart';
import 'package:pokemon_riverpod/network/dio_client.dart';
import 'package:pokemon_riverpod/utils/constant.dart';

class PokemonRepo {
  Future<List<Pokemon>> getAllPokemon() async {
    DioClient dioClient = DioClient();
    final response = await dioClient.get(POKEMON_API_URL);
    final List jsonResponse = jsonDecode(response.data);
    final List<Pokemon> pokemonList =
        jsonResponse.map((e) => Pokemon.fromJson(e)).toList();
    return pokemonList;
  }
}

final pokemonRepoProvider = Provider((ref) => PokemonRepo());
