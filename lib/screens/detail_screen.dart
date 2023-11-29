import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_riverpod/Widgets/common_scaffold.dart';
import 'package:pokemon_riverpod/modal/pokemon.dart';
import 'package:pokemon_riverpod/providers/pokemon_provider.dart';

class DetailScreen extends ConsumerWidget {
  const DetailScreen({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final pokemonNotifier = ref.watch(pokemonProvider.notifier);
    return CommonScaffold(
      body: Center(
        child: Column(
          children: [
            Hero(
              tag: pokemon.id.toString(),
              child: CachedNetworkImage(
                imageUrl: pokemon.imageurl.toString(),
              ),
            ),
            Text(pokemon.name.toString()),
            ElevatedButton(
                onPressed: () {
                  ref.read(pokemonProvider).addPokemonToDatabase(pokemon);
                },
                child: Text('Add Pokemon To Fav'))
          ],
        ),
      ),
    );
  }
  String  encryptData() {
    var iv = encrypt.IV.fromUtf8('''W@tcH0pHa\$e2RDHR''');
    var plainText = '''This is a test string''';
    var key = encrypt.Key.fromUtf8("OoYiqgFMREFEEFGTW@tcH0pHa\$e2RDHR");
 
    final encrypter = encrypt.Encrypter(
        encrypt.AES(key, mode: encrypt.AESMode.cbc, padding: 'PKCS7'));
 
    final encryptedText = encrypter.encrypt(plainText, iv: iv);
 
    print('THis is a encrypted string ${encryptedText.base64}');
    return encryptedText.base64;
  }
}
