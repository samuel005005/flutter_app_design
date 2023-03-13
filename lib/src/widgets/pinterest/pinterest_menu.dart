import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_design/src/widgets/pinterest/bloc/pinterest/pinterest_bloc.dart';
import 'package:flutter_app_design/src/widgets/pinterest/menu_items.dart';
import 'package:flutter_app_design/src/widgets/pinterest/pinterest_button.dart';
import 'package:flutter_app_design/src/widgets/pinterest/pinteret_menu_background.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PinterestMenu extends StatefulWidget {
  final bool show;

  const PinterestMenu({super.key, this.show = true});

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

    animationController.addListener(() {
      print(opacityBack.value);
    });
    super.initState();
  }

  final List<PinterestButton> items = [
    PinterestButton(
        icon: Icons.pie_chart,
        onPressed: () {
          if (kDebugMode) {
            print("Icon pie_chart");
          }
        }),
    PinterestButton(
      icon: Icons.search,
      onPressed: () {
        if (kDebugMode) {
          print("Icon search");
        }
      },
    ),
    PinterestButton(
      icon: Icons.notifications,
      onPressed: () {
        if (kDebugMode) {
          print("Icon notifications");
        }
      },
    ),
    PinterestButton(
      icon: Icons.supervised_user_circle,
      onPressed: () {
        if (kDebugMode) {
          print("Icon supervised_user_circle");
        }
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PinterestBloc(),
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
                child: MenuItems(menuItems: items),
              ),
            ),
          );
        },
      ),
    );
  }
}
