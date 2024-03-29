import 'package:flutter/material.dart';
import 'package:pokedex/dependencies/dependencies.dart';
import 'package:pokedex/features/search_poke_presenter.dart';

void main() {
  Dependencies.instance.registerDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SearchPokePresenter(),
      routes: {
        '/search': (context) => const SearchPokePresenter(),
      },
    );
  }
}
