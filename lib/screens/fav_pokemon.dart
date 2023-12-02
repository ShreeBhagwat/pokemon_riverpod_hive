import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_riverpod/providers/pokemon_provider.dart';

class FavPokemonScreen extends ConsumerWidget {
  const FavPokemonScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonNotifier = ref.watch(pokemonProvider);
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: false,
          floating: true,
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.pin,
            title: Text(
              'Fav Pokemon',
              style: TextStyle(color: Colors.black),
            ),
            background: Image.asset(
              'images/pokeball_image.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return ListTile(
              title: Text(index.toString()),
            );
          }, childCount: 100),
        ),
        SliverToBoxAdapter(
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
          ),
        )
      ],
    ));
  }
}
