import 'package:flutter/material.dart';
import 'package:flutter_app_design/src/widgets/pinterest/bloc/pinterest/pinterest_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'pinterest_button.dart';

class PinteresMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton item;
  const PinteresMenuButton(this.index, this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PinterestBloc, PinterestState>(
      builder: (context, state) {
        if (state is ItemSelected) {
          return _Item(
              index: index, item: item, selectedItem: state.selectedItem);
        }

        return _Item(index: index, item: item, selectedItem: 0);
      },
    );
  }
}

class _Item extends StatefulWidget {
  const _Item({
    required this.index,
    required this.item,
    required this.selectedItem,
  });

  final int index;
  final int selectedItem;
  final PinterestButton item;

  @override
  State<_Item> createState() => _ItemState();
}

class _ItemState extends State<_Item> with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late Animation<double> zoom;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 100), vsync: this);

    zoom = Tween(begin: 25.0, end: 30.0).animate(animationController);

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () async {
        context
            .read<PinterestBloc>()
            .add(ChangeOption(selectedItem: widget.index));
        widget.item.onPressed();
        animationController.reset();
        await animationController.forward();
      },
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return Icon(
            widget.item.icon,
            size: (widget.selectedItem == widget.index) ? zoom.value : 25,
            color: (widget.selectedItem == widget.index)
                ? Colors.black54
                : Colors.blueGrey,
          );
        },
      ),
    );
  }
}
