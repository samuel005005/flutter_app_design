import 'package:flutter/material.dart';

import 'pinteres_menu_button.dart';
import 'pinterest_button.dart';

class MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;
  const MenuItems({super.key, required this.menuItems});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(menuItems.length,
            (index) => PinteresMenuButton(index, menuItems[index])));
  }
}
