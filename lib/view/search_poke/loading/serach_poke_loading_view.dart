import 'package:flutter/material.dart';

class SearchPokeLoadingView extends StatefulWidget {
  const SearchPokeLoadingView({super.key});

  @override
  State<SearchPokeLoadingView> createState() => _SearchPokeLoadingStateView();
}

class _SearchPokeLoadingStateView extends State<SearchPokeLoadingView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(color: Colors.red,),
      ),
    );
  }
}