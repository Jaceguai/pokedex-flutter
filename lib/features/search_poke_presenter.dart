import 'package:flutter/material.dart';
import 'package:pokedex/dependencies/dependencies.dart';
import 'package:pokedex/domain/usecases/get_named_api_resource_usecase.dart';
import 'package:pokedex/domain/usecases/get_pokemon_detail_usecase.dart';
import 'package:pokedex/features/search_poke_controller.dart';

import '../view/search_poke/search_poke_views.dart';

class SearchPokePresenter extends StatefulWidget {
  const SearchPokePresenter({super.key});

  @override
  State<SearchPokePresenter> createState() => _SearchPokePresenterState();
}

class _SearchPokePresenterState extends State<SearchPokePresenter> {
  final SeachPokeController controller = SeachPokeController(
  getNamedApiResourcePokemonsUsecase: Dependencies.instance.get<GetNamedApiResourcePokemonUsecase>(),
  getPokemonDetailsUsecase: Dependencies.instance.get<GetPokemonDetailsUsecase>(),
);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: controller,
        builder: ((context, state, child) {
          if (state == null) {
            return const CircularProgressIndicator();
          }
          return SearchPokeSuccessView(state: state);
        }));
  }
}
