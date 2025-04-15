import 'package:basic_resume/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeViewLayout extends StatelessWidget {
  const HomeViewLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => const HomeViewMobile(),
      tablet: (BuildContext context) => const HomeViewTablet(),
      desktop: (BuildContext context) => const HomeViewDesktop(),
    );
  }
}
