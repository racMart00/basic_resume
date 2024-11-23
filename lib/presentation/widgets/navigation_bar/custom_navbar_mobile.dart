import 'package:flutter/material.dart';

import 'package:basic_resume/presentation/presentation.dart';

class CustomNavBarMobile extends StatelessWidget {
  const CustomNavBarMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(Icons.menu),
          ),

          NavBarLogo(),
        ],
      ),
    );
  }
}
