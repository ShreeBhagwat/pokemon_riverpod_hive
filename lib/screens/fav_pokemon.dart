import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_riverpod/providers/pokemon_provider.dart';

class FavPokemonScreen extends ConsumerWidget {
  const FavPokemonScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonNotifier = ref.watch(pokemonProvider);
    return Scaffold(
        body: ListView.builder(
            itemCount: pokemonNotifier.pokemonsFromDatabase.length,
            itemBuilder: (context, index) {
              final pokemon = pokemonNotifier.pokemonsFromDatabase[index];
              return ListTile(
                title: Text(pokemon.name.toString()),
                leading: Image.network(pokemon.imageurl.toString()),
                // trailing: IconButton(
                //     onPressed: () {
                //       ref
                //           .read(pokemonProvider)
                //           .deletePokemonFromDatabase(pokemon);
                //     },
                //     icon: const Icon(Icons.delete)),
              );
            }));
  }
}
