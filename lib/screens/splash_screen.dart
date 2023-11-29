import 'dart:convert';
import 'dart:developer';

import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_riverpod/extensions/buildcontext_extensions.dart';
import 'package:pokemon_riverpod/providers/pokemon_provider.dart';
import 'package:pokemon_riverpod/repository/pokemon_repo.dart';
import 'package:pokemon_riverpod/screens/all_pokemon_screen.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    decryptData();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500))
      ..repeat();

      

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

  String  encryptData() {
    var iv = encrypt.IV.fromUtf8('''W@tcH0pHa\$e2RDHR''');
    var plainText = '''This is a test string''';
    var key = encrypt.Key.fromUtf8("OoYiqgFMREFEEFGTW@tcH0pHa\$e2RDHR");

    final encrypter = encrypt.Encrypter(
        encrypt.AES(key, mode: encrypt.AESMode.cbc, padding: 'PKCS7'));

    final encryptedText = encrypter.encrypt(plainText, iv: iv);

    log('This is a encrypted string ${encryptedText.base64}');
    return encryptedText.base64;
  }

  String decryptData() {
    var iv = encrypt.IV.fromUtf8('''W@tcH0pHa\$e2RDHR''');
    var enData =
        '''p01fwS6Kcif8wQ3rTgDQN8wJMipgp/epxHS7g57iT6cvvLebXM0KedIq5HtB3yuVqUSg+xf088nhnvnfnTJvadZPvmE4BT3QO8eDzL2ERkhJ98kufacum+WhEVPdlpGH2CztkNklg7g0vB8KcHCi6VMlqWZgUIGj3PUge/VDFJHL1LXpDZbY+pQg6qW+Ol+mQvW8w4QTKZ2LSR8R6GsAYQ==''';
    var key = encrypt.Key.fromUtf8("OoYiqgFMREFEEFGTW@tcH0pHa\$e2RDHR");

    final encrypter = encrypt.Encrypter(
        encrypt.AES(key, mode: encrypt.AESMode.cbc, padding: 'PKCS7'));

    String decryptedString = encrypter.decrypt64(enData, iv: iv);
    log('This is a decrypted string $decryptedString');
    return decryptedString;
  }
  



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Transform(
                transform: Matrix4.identity()
                  ..translate(0.0, -_animationController.value * 100)
                  ..scale(1.0 - _animationController.value),
                alignment: Alignment.center,
                child: Transform.rotate(
                  angle: _animationController.value * 2 * 3.14,
                  child: Image.asset(
                    'images/pokeball_image.png',
                    height: 70,
                    width: 70,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
