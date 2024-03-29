
import 'package:pokedex/core/http/http.dart';
import 'package:pokedex/domain/entities/named_api_resource.dart';
import 'package:pokedex/domain/entities/pokemon.dart';

abstract class PokemonDatasource {
  Future<List<NamedApiResource>> getPokemonList(int offset, int limit);
  Future<PokemonEntity> getPokemonDetails(String url);
}

class PokemonDatasourceImpl implements PokemonDatasource {
  final IHttp _http;
  final Map<String, dynamic> _cache = {};

  PokemonDatasourceImpl(this._http);

  @override
  Future<List<NamedApiResource>> getPokemonList(int offset, int limit) async {
    final url = 'https://pokeapi.co/api/v2/pokemon/?offset=$offset&limit=$limit';

    if (_cache.containsKey(url)) {
      final data = _cache[url] as List<dynamic>;
      return data.map((json) => NamedApiResource(name: json['name'], url: json['url'])).toList();
    }

    try {
      final response = await _http.get(url);
      final List<dynamic> data = response.data['results'];
      _cache[url] = data;
      return data.map((json) => NamedApiResource(name: json['name'], url: json['url'])).toList();
    } catch (error) {
      throw Exception('Failed to fetch Pokémon list: $error');
    }
  }

  @override
  Future<PokemonEntity> getPokemonDetails(String url) async {
    if (_cache.containsKey(url)) {
      final data = _cache[url] as Map<String, dynamic>;
      return PokemonEntity.fromMap(data);
    }

    try {
      final response = await _http.get(url);
      final data = response.data;
      _cache[url] = data;
      return PokemonEntity.fromMap(data);
    } catch (error) {
      throw Exception('Failed to fetch Pokémon details: $error');
    }
  }
}
