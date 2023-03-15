import 'package:flutter/material.dart';
import 'package:flutter_app_design/src/widgets/pinterest/bloc/pinterest_menu/pinterest_menu_bloc.dart';

import 'package:flutter_app_design/src/widgets/pinterest/menu_items.dart';
import 'package:flutter_app_design/src/widgets/pinterest/pinterest_button.dart';
import 'package:flutter_app_design/src/widgets/pinterest/pinteret_menu_background.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PinterestMenu extends StatefulWidget {
  final bool show;
  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;
  final List<PinterestButton> items;

  const PinterestMenu({
    super.key,
    this.show = true,
    this.backgroundColor = Colors.white,
    this.activeColor = Colors.black,
    this.inactiveColor = Colors.blueGrey,
    required this.items,
  });

  @override
  State<PinterestMenu> createState() => _PinterestMenuState();
}

class _PinterestMenuState extends State<PinterestMenu>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> moveButton;
  late Animation<double> opacity;
  late Animation<double> opacityBack;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    opacity = Tween(begin: 0.0, end: 1.0).animate(animationController);
    opacityBack = Tween(begin: 1.0, end: 0.0).animate(animationController);
    moveButton = Tween(begin: 0.0, end: 25.0).animate(animationController);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PinterestMenuBloc(
          widget.backgroundColor, widget.activeColor, widget.inactiveColor),
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          if (widget.show) {
            animationController.forward();
          } else {
            animationController.reverse();
          }

          return Transform.translate(
            offset: Offset(0, -moveButton.value),
            child: Opacity(
              opacity: opacity.value,
              child: PinteretMenuBackGround(
                child: MenuItems(menuItems: widget.items),
              ),
            ),
          );
        },
      ),
    );
  }
}
