import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoes_app/src/bloc/bloc/shoes_bloc.dart';
import 'package:shoes_app/src/widgets/custom_widgets.dart';

class ShoesDescriptionPage extends StatelessWidget {
  const ShoesDescriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const ShoesSizePreview(fullScreen: true),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  ShoesDescription(
                    title: 'Nike Air Max 720',
                    description:
                        "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  ),
                  _AmountByNow(),
                  _ColorMore(),
                  Button(text: "Mo", width: 120, height: 40),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _AmountByNow extends StatelessWidget {
  const _AmountByNow();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        margin: const EdgeInsets.only(top: 20, bottom: 20),
        child: Row(
          children: const [
            Text('\$180.0',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            Spacer(),
            Button(text: "Buy now", width: 120, height: 40),
          ],
        ),
      ),
    );
  }
}

class _ColorMore extends StatelessWidget {
  const _ColorMore();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        _ButttonColor(Color(0xffC6D642)),
        _ButttonColor(Color(0xffFFAD29)),
        _ButttonColor(Color(0xff2099F1)),
        _ButttonColor(Color(0xff364D56)),
      ],
    );
  }
}

class _ButttonColor extends StatelessWidget {
  const _ButttonColor(
    this.color,
  );

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
