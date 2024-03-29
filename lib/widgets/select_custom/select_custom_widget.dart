import 'package:flutter/material.dart';
import 'package:pokedex/shared/colors_const.dart';

class SelectCustomWidget extends StatelessWidget {
  final String selectedType;
  final List<String> allTypes;
  final Function(String type) onChanged;

  const SelectCustomWidget({
    super.key,
    required this.selectedType,
    required this.allTypes,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          builder: (BuildContext context) {
            return SizedBox(
              height: MediaQuery.of(context).size.height / 1,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ListView.builder(
                  itemCount: allTypes.length , 
                  itemBuilder: (context, index) {                    
                      final typePokemon = allTypes[index];
                      final colorTypePokemon = index == 0 ? Colors.black  : PokeTypeColorsConst.fromString(typePokemon).mainColor;
                      return _buildCategoryButton(typePokemon, colorTypePokemon, context);
                  },
                ),
              ),
            );
          },
        );
      },
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 156),
        child: Container(
          height: 42,
          decoration: BoxDecoration(
            color:  selectedType == 'Todos os tipos' ? Colors.black : PokeTypeColorsConst.fromString(selectedType).mainColor,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  selectedType,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                ),
              ),
              const Icon(Icons.keyboard_arrow_down_outlined, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryButton(String typePokemon, Color colorTypePokemon, BuildContext context) {
    return Container(
      height: 42,
      decoration: BoxDecoration(
        color: colorTypePokemon,
        borderRadius: BorderRadius.circular(100),
      ),
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: ()=> onChanged(typePokemon),
          child: Center(
            child: Text(
              typePokemon,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
    );
  }
}
