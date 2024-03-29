import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/view/search_poke/success/search_poke_success_state.dart';
import 'package:pokedex/widgets/widgets.dart';

class SearchPokeSuccessView extends StatelessWidget {
  final SeachPokeSuccessState state;
  const SearchPokeSuccessView({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldGlobalWidget(
      body: Flexible(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            PokemonSearchInput(
              controller: state.searchController,
              onChanged: state.searchPokemon,
              onSubmitted: () {},
            ),
            const SizedBox(height: 36),
            SelectCustomWidget(
              selectedType: state.selectedType,
              onChanged: state.filterPokemonsBySelectedTypes,
              allTypes: state.typesAll,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: state.pokemonsResources.length,
                itemBuilder: (context, index) {
                  final pokemonResource = state.pokemonsResources[index];
                  return FutureBuilder<PokemonEntity>(
                    future: state.getPokemonDetails(pokemonResource),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final pokemon = snapshot.data!;
                        return CardPokemonWidget(pokemon: pokemon);
                      }
                      return const Center(
                        child: CardSkeletonWidget(),
                         
                       
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      navigationBarConfig: NavigationBarConfig(
        onDestinationSelected: (int index) {},
        selectedIndex: 1,
      ),
    );
  }
}
