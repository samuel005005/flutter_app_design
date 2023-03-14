import 'package:flutter/material.dart';
import 'package:flutter_app_design/src/widgets/pinterest/bloc/pinterest_menu/pinterest_menu_bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class PinteretMenuBackGround extends StatelessWidget {
  final Widget child;
  const PinteretMenuBackGround({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PinterestMenuBloc, PinterestMenuState>(
      builder: (context, state) {
        return Container(
          width: 300,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: state.backgroundColor,
            boxShadow: const [
              BoxShadow(
                color: Colors.black38,
                blurRadius: 10,
                spreadRadius: -2,
              )
            ],
          ),
          child: child,
        );
      },
    );
  }
}
