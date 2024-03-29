import 'package:flutter/material.dart';

abstract class PokeTypeColors {
  Color get mainColor;
  Color get lightColor;
  Color get secundaryTypeColor;
  String get iconsTypes;
}

class PokeTypeColorsConst {
  static PokeTypeColors normal = _Normal();
  static PokeTypeColors fire = _Fire();
  static PokeTypeColors water = _Water();
  static PokeTypeColors electric = _Electric();
  static PokeTypeColors grass = _Grass();
  static PokeTypeColors ice = _Ice();
  static PokeTypeColors fighting = _Fighting();
  static PokeTypeColors poison = _Poison();
  static PokeTypeColors ground = _Ground();
  static PokeTypeColors flying = _Flying();
  static PokeTypeColors psychic = _Psychic();
  static PokeTypeColors bug = _Bug();
  static PokeTypeColors rock = _Rock();
  static PokeTypeColors ghost = _Ghost();
  static PokeTypeColors dragon = _Dragon();
  static PokeTypeColors dark = _Dark();
  static PokeTypeColors steel = _Steel();
  static PokeTypeColors fairy = _Fairy();

  static PokeTypeColors fromString(String type) {
    switch (type.toLowerCase()) {
      case 'normal':
        return normal;
      case 'fire':
        return fire;
      case 'water':
        return water;
      case 'electric':
        return electric;
      case 'grass':
        return grass;
      case 'ice':
        return ice;
      case 'fighting':
        return fighting;
      case 'poison':
        return poison;
      case 'ground':
        return ground;
      case 'flying':
        return flying;
      case 'psychic':
        return psychic;
      case 'bug':
        return bug;
      case 'rock':
        return rock;
      case 'ghost':
        return ghost;
      case 'dragon':
        return dragon;
      case 'dark':
        return dark;
      case 'steel':
        return steel;
      case 'fairy':
        return fairy;
      default:
        return normal;
    }
  }
}

class _Normal implements PokeTypeColors {
  @override
  Color get mainColor => const Color(0xFFA8A878);

  @override
  Color get lightColor => const Color(0xFFC6C6A7);

  @override
  Color get secundaryTypeColor => const Color(0xFFA8A878);
  @override
  String get iconsTypes => 'assets/icons/types_of_icons_elements/normal.png';

}

class _Fire implements PokeTypeColors {
  @override
  Color get mainColor => const Color(0xFFF08030);

  @override
  Color get lightColor => const Color(0xFFF5AC78);

  @override
  Color get secundaryTypeColor => const Color(0xFFEE8130);

  @override
  String get iconsTypes => 'assets/icons/types_of_icons_elements/fire.png';
}

class _Water implements PokeTypeColors {
  @override
  Color get mainColor => const Color(0xFF6890F0);

  @override
  Color get lightColor => const Color(0xFF9DB7F5);

  @override
  Color get secundaryTypeColor => const Color(0xFF6390F0);

  @override
  String get iconsTypes => 'assets/icons/types_of_icons_elements/water.png';
}

class _Electric implements PokeTypeColors {
  @override
  Color get mainColor => const Color(0xFFF8D030);

  @override
  Color get lightColor => const Color(0xFFFAD55C);

  @override
  Color get secundaryTypeColor => const Color(0xFFF7D02C);

  @override
  String get iconsTypes => 'assets/icons/types_of_icons_elements/electric.png';
}

class _Grass implements PokeTypeColors {
  @override
  Color get mainColor => const Color(0xFF78C850);

  @override
  Color get lightColor => const Color(0xFFA7DB8D);

  @override
  Color get secundaryTypeColor => const Color(0xFF7AC74C);

  @override
  String get iconsTypes => 'assets/icons/types_of_icons_elements/grass.png';
}

class _Ice implements PokeTypeColors {
  @override
  Color get mainColor => const Color(0xFF98D8D8);

  @override
  Color get lightColor => const Color(0xFFBCE6E6);

  @override
  Color get secundaryTypeColor => const Color(0xFF96D9D6);

  @override
  String get iconsTypes => 'assets/icons/types_of_icons_elements/ice.png';
}

class _Fighting implements PokeTypeColors {
  @override
  Color get mainColor => const Color(0xFFC03028);

  @override
  Color get lightColor => const Color(0xFFD67873);

  @override
  Color get secundaryTypeColor => const Color(0xFFC02F27);

  @override
  String get iconsTypes => 'assets/icons/types_of_icons_elements/fighter.png';
}

class _Poison implements PokeTypeColors {
  @override
  Color get mainColor => const Color(0xFFA040A0);

  @override
  Color get lightColor => const Color(0xFFC183C1);

  @override
  Color get secundaryTypeColor => const Color(0xFFA43FA4);

  @override
  String get iconsTypes => 'assets/icons/types_of_icons_elements/poison.png';
}

class _Ground implements PokeTypeColors {
  @override
  Color get mainColor => const Color(0xFFE0C068);

  @override
  Color get lightColor => const Color(0xFFEBD69D);

  @override
  Color get secundaryTypeColor => const Color(0xFFDEA635);

  @override
  String get iconsTypes => 'assets/icons/types_of_icons_elements/ground.png';
}

class _Flying implements PokeTypeColors {
  @override
  Color get mainColor => const Color(0xFFA890F0);

  @override
  Color get lightColor => const Color(0xFFC6B7F5);

  @override
  Color get secundaryTypeColor => const Color(0xFFA68BF2);

  @override
  String get iconsTypes => 'assets/icons/types_of_icons_elements/flying.png';
}

class _Psychic implements PokeTypeColors {
  @override
  Color get mainColor => const Color(0xFFF85888);

  @override
  Color get lightColor => const Color(0xFFF5A9B8);

  @override
  Color get secundaryTypeColor => const Color(0xFFF95587);

  @override
  String get iconsTypes => 'assets/icons/types_of_icons_elements/psychic.png';
}

class _Bug implements PokeTypeColors {
  @override
  Color get mainColor => const Color(0xFFA8B820);

  @override
  Color get lightColor => const Color(0xFFC6D16E);

  @override
  Color get secundaryTypeColor => const Color(0xFFA8B820);

  @override 
  String get iconsTypes => 'assets/icons/types_of_icons_elements/bug.png';
}

class _Rock implements PokeTypeColors {
  @override
  Color get mainColor => const Color(0xFFB8A038);

  @override
  Color get lightColor => const Color(0xFFD1C17D);

  @override
  Color get secundaryTypeColor => const Color(0xFFB6A136);

  @override
  String get iconsTypes => 'assets/icons/types_of_icons_elements/rock.png';
}

class _Ghost implements PokeTypeColors {
  @override
  Color get mainColor => const Color(0xFF705898);

  @override
  Color get lightColor => const Color(0xFFA292BC);

  @override
  Color get secundaryTypeColor => const Color(0xFF705898);

  @override
  String get iconsTypes => 'assets/icons/types_of_icons_elements/ghost.png';
}

class _Dragon implements PokeTypeColors {
  @override
  Color get mainColor => const Color(0xFF7038F8);

  @override
  Color get lightColor => const Color(0xFF8C6ED7);

  @override
  Color get secundaryTypeColor => const Color(0xFF7038F8);

  @override
  String get iconsTypes => 'assets/icons/types_of_icons_elements/dragon.png';
}

class _Dark implements PokeTypeColors {
  @override
  Color get mainColor => const Color(0xFF705848);

  @override
  Color get lightColor => const Color(0xFFA29288);

  @override
  Color get secundaryTypeColor => const Color(0xFF705848);

  @override
  String get iconsTypes => 'assets/icons/types_of_icons_elements/dark.png';
}

class _Steel implements PokeTypeColors {
  @override
  Color get mainColor => const Color(0xFFB8B8D0);

  @override
  Color get lightColor => const Color(0xFFD1D1E0);

  @override
  Color get secundaryTypeColor => const Color(0xFFB7B7CE);

  @override
  String get iconsTypes => 'assets/icons/types_of_icons_elements/steel.png';
}

class _Fairy implements PokeTypeColors {
  @override
  Color get mainColor => const Color(0xFFEE99AC);

  @override
  Color get lightColor => const Color(0xFFF4BDC9);

  @override
  Color get secundaryTypeColor => const Color(0xFFEE99AC);

  @override
  String get iconsTypes => 'assets/icons/types_of_icons_elements/fairy.png';
}
