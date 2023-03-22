import 'package:flutter/material.dart';

class ShoesSizePreview extends StatelessWidget {
  const ShoesSizePreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      child: Container(
        width: double.infinity,
        height: 430,
        decoration: BoxDecoration(
          color: const Color(0xffFFCF53),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Column(
          children: const [
            _ShoesWithShadows(),
            _ShoesSize(),
          ],
        ),
      ),
    );
  }
}

class _ShoesSize extends StatelessWidget {
  const _ShoesSize();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          _ShowSizeBox(7),
          _ShowSizeBox(7.5),
          _ShowSizeBox(8),
          _ShowSizeBox(8.5),
          _ShowSizeBox(9),
          _ShowSizeBox(9.5),
        ],
      ),
    );
  }
}

class _ShowSizeBox extends StatelessWidget {
  final double size;
  const _ShowSizeBox(this.size);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          //TODO:  BoxShadow(),
        ],
      ),
      child: Text(
        size.toString().replaceAll('.0', ''),
        style: const TextStyle(
          color: Color(0xffF1A23A),
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _ShoesWithShadows extends StatelessWidget {
  const _ShoesWithShadows();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Stack(
        children: const <Widget>[
          Positioned(
            bottom: 10,
            right: 0,
            child: _ShoesShadows(),
          ),
          Image(image: AssetImage('assets/images/azul.png'))
        ],
      ),
    );
  }
}

class _ShoesShadows extends StatelessWidget {
  const _ShoesShadows();

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 260,
        height: 120,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(100),
          boxShadow: const [
            BoxShadow(
              color: Color(0xffEAA14E),
              blurRadius: 40,
            ),
          ],
        ),
      ),
    );
  }
}
