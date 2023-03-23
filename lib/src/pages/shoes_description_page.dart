import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoes_app/src/bloc/bloc/shoes_bloc.dart';
import 'package:shoes_app/src/helpers/helpers.dart';
import 'package:shoes_app/src/widgets/custom_widgets.dart';
import 'package:animate_do/animate_do.dart';

class ShoesDescriptionPage extends StatelessWidget {
  const ShoesDescriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    changeStatusLight();
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              const Hero(
                  tag: 'preview', child: ShoesSizePreview(fullScreen: true)),
              Positioned(
                top: 50,
                child: FloatingActionButton(
                  onPressed: () {
                    changeStatusDark();
                    Navigator.pop(context);
                  },
                  elevation: 0,
                  highlightElevation: 0,
                  backgroundColor: Colors.transparent,
                  child: const Icon(
                    Icons.chevron_left,
                    size: 60,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
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
                  _ButtonLikeCartSettings()
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      child: Row(
        children: [
          const Text('\$180.0',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          const Spacer(),
          Bounce(
            delay: const Duration(seconds: 1),
            from: 8,
            child: const Button(text: "Buy now", width: 120, height: 40),
          ),
        ],
      ),
    );
  }
}

class _ColorMore extends StatelessWidget {
  const _ColorMore();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Expanded(
              child: Stack(
            children: const [
              Positioned(left: 90, child: _ButttonColor(Color(0xffC6D642), 4)),
              Positioned(left: 60, child: _ButttonColor(Color(0xffFFAD29), 3)),
              Positioned(left: 30, child: _ButttonColor(Color(0xff2099F1), 2)),
              _ButttonColor(Color(0xff364D56), 1),
            ],
          )),
          // const Spacer(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Button(
              text: "More related items",
              width: 170,
              height: 30,
              backgroundColor: Color(0xffFFC675),
            ),
          ),
        ],
      ),
    );
  }
}

class _ButttonColor extends StatelessWidget {
  final Color color;
  final int index;
  const _ButttonColor(
    this.color,
    this.index,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        String assetImage = "azul.png";
        switch (index) {
          case 1:
            assetImage = "negro.png";
            break;
          case 2:
            assetImage = "azul.png";
            break;
          case 3:
            assetImage = "amarillo.png";
            break;
          case 4:
            assetImage = "verde.png";
            break;
          default:
        }

        context.read<ShoesBloc>().add(ChangeShoeImage(assetImage: assetImage));
      },
      child: FadeInLeft(
        delay: Duration(milliseconds: index * 100),
        duration: const Duration(milliseconds: 300),
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

class _ButtonLikeCartSettings extends StatelessWidget {
  const _ButtonLikeCartSettings();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const _ButtonShadow(
              icon: Icon(Icons.heart_broken, color: Colors.red, size: 25)),
          _ButtonShadow(
              icon: Icon(Icons.add_shopping_cart,
                  color: Colors.grey.withOpacity(0.4), size: 25)),
          _ButtonShadow(
              icon: Icon(Icons.settings,
                  color: Colors.grey.withOpacity(0.4), size: 25)),
        ],
      ),
    );
  }
}

class _ButtonShadow extends StatelessWidget {
  final Icon icon;
  const _ButtonShadow({
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: -5,
            blurRadius: 20,
            offset: Offset(0, 10),
          )
        ],
      ),
      child: icon,
    );
  }
}
