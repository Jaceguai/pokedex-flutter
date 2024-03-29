import 'package:pokedex/core/gateway/gateway.dart';
import 'package:pokedex/core/http/http.dart';
import 'package:pokedex/data/datasources/pokemon/pokemon_datasource.dart';
import 'package:pokedex/data/repositories/pokemon/pokemons_repository.dart';
import 'package:pokedex/domain/repositories/pokemon_repository.dart';
import 'package:pokedex/domain/usecases/get_named_api_resource_usecase.dart';
import 'package:pokedex/domain/usecases/get_pokemon_detail_usecase.dart';

class Dependencies {
  static final Dependencies _instance = Dependencies._internal();

  static get instance => _instance;

  factory Dependencies() {
    return _instance;
  }

  Dependencies._internal();

  final _dependencies = <Type, dynamic>{};

  void register<T>(T instance) {
    _dependencies[T] = instance;
  }

  T get<T>() {
    return _dependencies[T];
  }

  void registerDependencies() {
    register<IHttp>(DioHttp());

    register<PokemonDatasource>(PokemonDatasourceImpl(get( )));

    register<PokemonRepository>(PokemonRepositoryImpl(dataSource: get()));

    register<GetPokemonDetailsUsecase>(GetPokemonDetailsUsecaseImpl(repository: get()));
    register<GetNamedApiResourcePokemonUsecase>(GetNamedApiResourcePokemonUsecaseImpl(repository: get()));
  }
}
