import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_design/src/widgets/pinterest/bloc/pinterest/pinterest_bloc.dart';
import 'package:flutter_app_design/src/widgets/pinterest/menu_items.dart';
import 'package:flutter_app_design/src/widgets/pinterest/pinterest_button.dart';
import 'package:flutter_app_design/src/widgets/pinterest/pinteret_menu_background.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PinterestMenu extends StatelessWidget {
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

  final bool show;

  PinterestMenu({super.key, this.show = true});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PinterestBloc(),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: (show) ? 1 : 0,
        child: PinteretMenuBackGround(
          child: MenuItems(menuItems: items),
        ),
      ),
    );
  }
}
