import 'package:flutter/material.dart';
import 'package:pokedex/domain/entities/named_api_resource.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/domain/usecases/get_named_api_resource_usecase.dart';
import 'package:pokedex/domain/usecases/get_pokemon_detail_usecase.dart';
import 'package:pokedex/view/search_poke/success/search_poke_success_state.dart';

class SeachPokeController extends ValueNotifier<SeachPokeSuccessState?> {
  final GetNamedApiResourcePokemonUsecase getNamedApiResourcePokemonsUsecase;
  final GetPokemonDetailsUsecase getPokemonDetailsUsecase;
  SeachPokeController({required this.getNamedApiResourcePokemonsUsecase, required this.getPokemonDetailsUsecase}) : super(null) {
    emitState();
    init();
  }

  List<NamedApiResource> pokemonsResources = [];
  List<String> typesAll = [];
  final TextEditingController searchController = TextEditingController();
  String selectedType = 'Todos os tipos';
  Set<NamedApiResource> visiblePokemons = {};

  void init() async {
    pokemonsResources = await getNamedApiResourcePokemonsUsecase(0, 10000);
    pokemonsResources.sort((a, b){
      int idA = int.parse(a.url.split('/').reversed.elementAt(1));
      int idB = int.parse(b.url.split('/').reversed.elementAt(1));
      return idA.compareTo(idB);
    } );

    typesAll = ['Todos os tipos', 'Grass', 'Poison', 'Fire', 'Flying', 'Water', 'Bug', 'Normal', 'Electric', 'Ground', 'Fairy', 'Fighting', 'Psychic', 'Rock', 'Steel', 'Ice', 'Ghost', 'Dragon', 'Dark'];
    applyFilter();
    emitState();
  }

  void emitState() {
    value = SeachPokeSuccessState(
      pokemonsResources: visiblePokemons.toList(),
      typesAll: typesAll,
      filterPokemonsBySelectedTypes: filterPokemonsBySelectedTypes,
      searchPokemon: searchPokemon,
      getPokemonDetails: getPokemonDetails,
      searchController: searchController,
      selectedType: selectedType,
    );
  }

  Future<bool> isPokemonInFilter(NamedApiResource pokemon) async {
    if (searchController.text.isNotEmpty) {
      if (!pokemon.name.toLowerCase().contains(searchController.text.toLowerCase())) {
        return false;
      }
    }
    if (selectedType != typesAll.first) {
      final pokemonDetails = await getPokemonDetails(pokemon);
      if (!pokemonDetails.types.any((type) => type.type.name == selectedType.toLowerCase())) {
        return false;
      }
    }
    return true;
  }

  Future<void> applyFilter() async {
    int indexStart = visiblePokemons.isEmpty ? -1 : pokemonsResources.indexOf(visiblePokemons.last);
    indexStart++;
    for (int i = indexStart; i < pokemonsResources.length; i++) {
      final pokemon = pokemonsResources[i];

      if (await isPokemonInFilter(pokemon)) {
        if (!visiblePokemons.contains(pokemon)) {
          visiblePokemons.add(pokemon);
          emitState();
          return;
        }
      }
    }
  }

  void filterPokemonsBySelectedTypes(String type) {
    selectedType = type;
    visiblePokemons = {};
    applyFilter();
  }

  void searchPokemon(String searchValue) {
    visiblePokemons = {};
    applyFilter();
  }

  Future<PokemonEntity> getPokemonDetails(NamedApiResource namedApiResource) async {
    if (namedApiResource == visiblePokemons.lastOrNull) {
      await applyFilter();
    }
    return getPokemonDetailsUsecase(namedApiResource.url);
  }
}
