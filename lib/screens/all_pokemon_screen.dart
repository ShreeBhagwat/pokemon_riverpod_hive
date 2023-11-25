import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_riverpod/extensions/buildcontext_extensions.dart';
import 'package:pokemon_riverpod/providers/pokemon_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pokemon_riverpod/screens/detail_screen.dart';
import 'package:pokemon_riverpod/screens/fav_pokemon.dart';
import 'package:crypto/crypto.dart';

class AllPokemonScreen extends ConsumerWidget {
  const AllPokemonScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonNotifier = ref.watch(pokemonProvider);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
               
              },
              icon: const Icon(Icons.favorite))
        ],
      ),
      body: GridView.builder(
          itemCount: pokemonNotifier.allPokemons.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 4, crossAxisSpacing: 4),
          // gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          //   maxCrossAxisExtent: 200,
          //   childAspectRatio: 3 / 2,
          //   crossAxisSpacing: 10,
          //   mainAxisSpacing: 10,

          // ),
          itemBuilder: (context, index) {
            final pokemon = pokemonNotifier.allPokemons[index];
            return Padding(
              padding: const EdgeInsets.only(left: 2.0, top: 2.0),
              child: Card(
                child: InkWell(
                  onTap: () {
                    context.navigateToScreen(
                        screen: DetailScreen(pokemon: pokemon));
                  },
                  child: Stack(
                    children: [
                      Hero(
                        tag: pokemon.id.toString(),
                        child: CachedNetworkImage(
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          errorWidget: (context, url, error) => const Icon(
                            Icons.error,
                            color: Colors.red,
                          ),
                          height: context.getWidth(percentage: 0.3),
                          // fit: BoxFit.fitHeight,
                          imageUrl: pokemon.imageurl.toString(),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              pokemon.name.toString(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
