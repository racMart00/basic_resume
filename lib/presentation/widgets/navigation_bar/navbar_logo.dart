import 'package:flutter/material.dart';

class NavBarLogo extends StatelessWidget {
  const NavBarLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(children: [Icon(Icons.abc_rounded), Text('racMart')]),
    );
  }
}
