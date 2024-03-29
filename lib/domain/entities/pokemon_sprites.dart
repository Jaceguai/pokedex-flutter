class PokemonSprites {
  final String? frontDefault;
  final String? frontShiny;
  final String? frontFemale;
  final String? frontShinyFemale;
  final String? backDefault;
  final String? backShiny;
  final String? backFemale;
  final String? backShinyFemale;

  PokemonSprites({
    required this.frontDefault,
    required this.frontShiny,
    required this.frontFemale,
    required this.frontShinyFemale,
    required this.backDefault,
    required this.backShiny,
    required this.backFemale,
    required this.backShinyFemale,
  });

  factory PokemonSprites.fromJson(Map<String, dynamic> json) {
    return PokemonSprites(
      frontDefault: json['front_default'],
      frontShiny: json['front_shiny'],
      frontFemale: json['front_female'],
      frontShinyFemale: json['front_shiny_female'],
      backDefault: json['back_default'],
      backShiny: json['back_shiny'],
      backFemale: json['back_female'],
      backShinyFemale: json['back_shiny_female'],
    );
  }
}