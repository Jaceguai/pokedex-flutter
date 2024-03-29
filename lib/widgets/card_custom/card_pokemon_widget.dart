import 'package:flutter/material.dart';
import 'package:pokedex/domain/entities/pokemon.dart';

class CardPokemonWidget extends StatelessWidget {
  final PokemonEntity pokemon;

  const CardPokemonWidget({
    super.key,
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    final typeColor = pokemon.pokeTypeColors;

    return Card(
      key: ValueKey(pokemon.id),
      elevation: 4,
      color: typeColor.lightColor.withOpacity(0.4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Nº ${pokemon.id}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text(pokemon.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                const SizedBox(height: 8),
                Row(
                  children: pokemon.types.map((type) {
                    final pokeTypeColors = type.pokeTypeColors;
                    return Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          margin: const EdgeInsets.only(right: 4),
                          height: 26,
                          decoration: BoxDecoration(color: pokeTypeColors.mainColor, borderRadius: BorderRadius.circular(25)),
                          child: Row(
                            children: [
                              Container(
                                height: 22,
                                padding: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                                child: Image.asset(pokeTypeColors.iconsTypes),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                type.type.name,
                                style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          if (pokemon.imageUrl != null)
            Container(
              width: 126,
              height: 102,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: typeColor.lightColor),
              child: Image.network(pokemon.imageUrl!, fit: BoxFit.contain, alignment: Alignment.center),
            ),
        ],
      ),
    );
  }
}
