import 'package:flutter/material.dart';
import 'package:pokedex/domain/entities/named_api_resource.dart';
import 'package:pokedex/domain/entities/pokemon.dart';

class SeachPokeSuccessState {
  final List<NamedApiResource> pokemonsResources;
  final List<String> typesAll;
  final Function(String type) filterPokemonsBySelectedTypes;
  final Function(String searchValue) searchPokemon;
  final Future<PokemonEntity> Function(NamedApiResource namedApiResource) getPokemonDetails;
  final TextEditingController searchController;
  final String selectedType;
  
  SeachPokeSuccessState({
    required this.pokemonsResources,
    required this.typesAll,
    required this.filterPokemonsBySelectedTypes,
    required this.searchPokemon,
    required this.getPokemonDetails,
    required this.searchController,
    required this.selectedType,
  });
}
