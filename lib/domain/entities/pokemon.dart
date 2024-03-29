import 'package:pokedex/domain/entities/named_api_resource.dart';
import 'package:pokedex/domain/entities/pokemon_sprites.dart';
import 'package:pokedex/domain/entities/pokemon_type.dart';
import 'package:pokedex/shared/colors_const.dart';

class PokemonEntity {
  int id;
  String name;
  List<PokemonTypeEntity> types;
  PokemonSprites sprites;

  PokemonEntity({
    required this.id,
    required this.name,
    required this.types,
    required this.sprites,
  });

  factory PokemonEntity.fromMap(Map<String, dynamic> map) {
    return PokemonEntity(
      id: map['id'],
      name: map['name'],
      types: List<PokemonTypeEntity>.from(map['types'].map<PokemonTypeEntity>((type) => PokemonTypeEntity(
            slot: type['slot'],
            type: NamedApiResource(name: type['type']['name'], url: type['type']['url']),
          ))),
      sprites: PokemonSprites.fromJson(map['sprites']),
    );
  }

  PokeTypeColors get pokeTypeColors => types.first.pokeTypeColors;

  String? get imageUrl => sprites.frontDefault;
}
