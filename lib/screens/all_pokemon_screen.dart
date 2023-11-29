import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_riverpod/extensions/buildcontext_extensions.dart';
import 'package:pokemon_riverpod/modal/pokemon.dart';
import 'package:pokemon_riverpod/providers/pokemon_future_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pokemon_riverpod/screens/detail_screen.dart';
import 'package:pokemon_riverpod/screens/splash_screen.dart';

class AllPokemonScreen extends ConsumerWidget {
  const AllPokemonScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonAsync = ref.watch(pokemonFutureProvider);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                context.showCustomSnackbar(
                    title: 'Error',
                    message: 'Error Fetching Pokemon',
                    messageType: MessageType.error);
              },
              icon: const Icon(Icons.favorite))
        ],
      ),
      body: pokemonAsync.when(
          data: (pokemonList) => PokemonGrideView(
                pokemonList: pokemonList,
              ),
          error: ((error, stackTrace) {
            return Center(
              child: Text(
                error.toString(),
                style: Theme.of(context).textTheme.headline6,
              ),
            );
          }),
          loading: () => const SplashScreen()),
    );
  }
}

class PokemonGrideView extends StatelessWidget {
  const PokemonGrideView({super.key, required this.pokemonList});
  final List<Pokemon> pokemonList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: pokemonList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 4, crossAxisSpacing: 4),
        itemBuilder: (context, index) {
          final pokemon = pokemonList[index];
          return Padding(
            padding: const EdgeInsets.only(left: 2.0, top: 2.0),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: Colors.red,
              child: InkWell(
                onTap: () {
                  context.navigateToScreen(
                      screen: DetailScreen(pokemon: pokemon), replace: false);
                },
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(pokemon.name.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                        color: Colors.white, fontSize: 20)),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -20,
                      right: -20,
                      child: Image.asset(
                        'images/pokeball.png',
                        height: context.getWidth(percentage: 0.35),
                        width: context.getWidth(percentage: 0.35),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Hero(
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
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
