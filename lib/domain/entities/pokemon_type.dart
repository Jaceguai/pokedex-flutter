import 'package:pokedex/domain/entities/named_api_resource.dart';
import 'package:pokedex/shared/colors_const.dart';

class PokemonTypeEntity {
  final int slot;
  final NamedApiResource type;


  PokemonTypeEntity({required this.slot, required this.type});

  factory PokemonTypeEntity.fromJson(Map<String, dynamic> json) {
    return PokemonTypeEntity(
      slot: json['slot'],
      type: NamedApiResource.fromJson(json['type']),
    );
  }

    PokeTypeColors get pokeTypeColors => PokeTypeColorsConst.fromString(type.name);

}