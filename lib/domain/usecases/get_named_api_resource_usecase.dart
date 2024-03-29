import 'package:pokedex/domain/entities/named_api_resource.dart';
import 'package:pokedex/domain/repositories/pokemon_repository.dart';

abstract class GetNamedApiResourcePokemonUsecase {
  Future<List<NamedApiResource>> call(int offset, int limit);
}

class GetNamedApiResourcePokemonUsecaseImpl extends GetNamedApiResourcePokemonUsecase {
  final PokemonRepository repository;

  GetNamedApiResourcePokemonUsecaseImpl({required this.repository});

  @override
  Future<List<NamedApiResource>> call(int offset, int limit) async {
    return repository.getPokemonList(offset, limit);
  }
}
