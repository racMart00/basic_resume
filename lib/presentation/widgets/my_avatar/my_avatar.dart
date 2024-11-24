import 'package:flutter/material.dart';

class MyAvatar extends StatelessWidget {
  const MyAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: size.height * 0.5, // Ancho del container
      height: size.height * 0.5, // Alto del container
      decoration: BoxDecoration(
        color: Colors.blue, // Color de fondo
        shape: BoxShape.circle, // Forma circular
        border: Border.all(
          color: Colors.white,
          width: 4,
        ), // Borde blanco
      ),
    );
  }
}