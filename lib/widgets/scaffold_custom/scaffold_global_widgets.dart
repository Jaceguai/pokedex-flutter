import 'package:flutter/material.dart';

class ScaffoldGlobalWidget extends StatelessWidget {
  final Widget body;
  final NavigationBarConfig navigationBarConfig;

  const ScaffoldGlobalWidget({
    super.key,
    required this.body,
    required this.navigationBarConfig,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 50),
            body,
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        indicatorColor: Colors.transparent,
        onDestinationSelected: navigationBarConfig.onDestinationSelected,
        selectedIndex: navigationBarConfig.selectedIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Image(image: AssetImage('assets/icons/icons_menu/pokeboll_selected.png')),
            icon: Image(image: AssetImage('assets/icons/icons_menu/pokeboll_selected.png')),
            label: 'Pokedex',
          ),
          NavigationDestination(
            selectedIcon: Image(image: AssetImage('assets/icons/icons_menu/location_outiline.png')),
            icon: Image(image: AssetImage('assets/icons/icons_menu/location_selected.png')),
            label: 'Regiões',
          ),
          NavigationDestination(
            icon: Image(image: AssetImage('assets/icons/icons_menu/favorite_outiline.png')),
            selectedIcon: Image(image: AssetImage('assets/icons/icons_menu/favorite_selected.png')),
            label: 'Favoritos',
          ),
        ],
      ),
    );
  }
}

class NavigationBarConfig {
  final Function(int)? onDestinationSelected;
  final int selectedIndex;

  const NavigationBarConfig({
    required this.onDestinationSelected,
    required this.selectedIndex,
  });
}
