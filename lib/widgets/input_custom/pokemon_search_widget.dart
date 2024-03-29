import 'package:flutter/material.dart';

class PokemonSearchInput extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final void Function()? onSubmitted;

  const PokemonSearchInput({
    super.key,
    required this.controller,
    this.onChanged,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.grey, fontSize: 16),
        decoration: InputDecoration(
          hintText: 'Procurar Pokémon...',
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          hintStyle: const TextStyle(color: Colors.grey),
          prefixIcon: const Icon(Icons.search, color: Color.fromARGB(255, 110, 110, 110)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: const BorderSide(color: Colors.blueGrey),
          ),
        ),
        onChanged:(value)=> onChanged!(value),
        onSubmitted: (_) {
          if (onSubmitted != null) {
            onSubmitted!();
          }
        },
      ),
    );
  }
}
