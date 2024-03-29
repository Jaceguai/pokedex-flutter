import 'package:pokedex/data/datasources/pokemon/pokemon_datasource.dart';
import 'package:pokedex/domain/entities/named_api_resource.dart';
import 'package:pokedex/domain/repositories/pokemon_repository.dart';
import 'package:pokedex/domain/entities/pokemon.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonDatasource dataSource;

  PokemonRepositoryImpl({required this.dataSource});

  @override
  Future<List<NamedApiResource>> getPokemonList(int offset, int limit) async {
    try {
      List<NamedApiResource> response = await dataSource.getPokemonList(offset,limit);

      return response;
    } catch (e) {
      throw Exception('Failed to get named API resource pokémons: $e');
    }
  }

  @override
  Future<PokemonEntity> getPokemonDetails(String url) async {
    try {
      return await dataSource.getPokemonDetails(url);
    } catch (e) {
      throw Exception('Failed to get Pokémon details: $e');
    }
  }
}
