import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/domain/repositories/pokemon_repository.dart';

abstract class GetPokemonDetailsUsecase{
  Future<PokemonEntity> call(String url);
} 

class GetPokemonDetailsUsecaseImpl extends GetPokemonDetailsUsecase{
  final PokemonRepository repository;

  GetPokemonDetailsUsecaseImpl({required this.repository});

  @override
  Future<PokemonEntity> call(String url) async {
    return repository.getPokemonDetails(url);
  }
}