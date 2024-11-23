import 'package:flutter/material.dart';

import 'package:basic_resume/presentation/presentation.dart';

class CustomNavBarTabletDesktop extends StatelessWidget {
  const CustomNavBarTabletDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NavBarLogo(),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              NavBarItem(title: "Episodes"),
              SizedBox(width: 60),
              NavBarItem(title: "About"),
            ],
          ),
        ],
      ),
    );
  }
}
