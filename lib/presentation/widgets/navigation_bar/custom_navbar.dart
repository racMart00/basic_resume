import 'package:basic_resume/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => const CustomNavBarMobile(),
      tablet: (BuildContext context) => const CustomNavBarTabletDesktop(),
    );
  }
}
