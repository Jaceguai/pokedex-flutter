import 'package:pokedex/domain/entities/named_api_resource.dart';
import 'package:pokedex/domain/entities/pokemon.dart';

abstract class PokemonRepository {
  Future<PokemonEntity> getPokemonDetails(String url);
  Future<List<NamedApiResource>> getPokemonList(int offset, int limit);
}
