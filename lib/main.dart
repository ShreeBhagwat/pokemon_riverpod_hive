import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pokemon_riverpod/modal/pokemon.dart';
import 'package:pokemon_riverpod/repository/hive_repository.dart';
import 'package:pokemon_riverpod/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  HiveRepository.registerHiveAdapters();
  runApp(const ProviderScope(child: PokemonRiverpod()));
}

class PokemonRiverpod extends StatelessWidget {
  const PokemonRiverpod({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: SplashScreen());
  }
}

//dart run build_runner watch --delete-conflicting-outputs  
