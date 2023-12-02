import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_riverpod/extensions/buildcontext_extensions.dart';

import 'package:pokemon_riverpod/screens/webview_screen.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
  

    // Future.microtask(() async {
    //   fetchPokemonList();
    //   ref.read(pokemonProvider).getAllPokemonFromDatabase();
    // });
  }

  // void fetchPokemonList() async {
  //   await ref.read(pokemonProvider).getAllPokemon().then((value) {
  //     context.navigateToScreen(screen: const AllPokemonScreen(), replace: true);
  //   }).catchError((e) {
  //     log('Error fetching Pokemon list!, try again $e');
  //   });
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                context.navigateToScreen(
                    screen: const WebviewScreen(
                        url: 'http://nossl.softperfect.com'));
              },
              icon: Icon(Icons.web))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 3,
                child: Center(
                  child: Container(child: Text('asdasdsadasd')),
                ),
              ),
              Flexible(
                flex: 1,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.add),
                      ),
                      Text('asdasdsadasd')
                    ],
                  ),
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // _animationController.dispose();
    super.dispose();
  }
}
