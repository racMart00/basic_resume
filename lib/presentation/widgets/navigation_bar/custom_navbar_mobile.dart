import 'package:flutter/material.dart';

import 'package:basic_resume/presentation/presentation.dart';

class CustomNavBarMobile extends StatelessWidget {
  const CustomNavBarMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.width * 0.12,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NavBarLogo(),

          IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(Icons.menu),
          ),
        ],
      ),
    );
  }
}
