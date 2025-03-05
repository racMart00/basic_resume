import 'package:basic_resume/presentation/presentation.dart';
import 'package:flutter/material.dart';

class CustomNavBarMobile extends StatelessWidget {
  const CustomNavBarMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.width * 0.12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const NavBarLogo(),

          IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu),
          ),
        ],
      ),
    );
  }
}
