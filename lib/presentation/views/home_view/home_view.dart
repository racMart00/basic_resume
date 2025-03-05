import 'package:basic_resume/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => const HomeContentMobile(),
      tablet: (BuildContext context) => const HomeContentTablet(),
      desktop: (BuildContext context) => const HomeContentDesktop(),
    );
  }
}
