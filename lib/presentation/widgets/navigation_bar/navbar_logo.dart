import 'package:flutter/material.dart';

class NavBarLogo extends StatelessWidget {
  const NavBarLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.width * 0.08,
      child: Row(
        children: [
          //TODO: logo
          Text('racMart', style: Theme.of(context).textTheme.displayMedium),
        ],
      ),
    );
  }
}
