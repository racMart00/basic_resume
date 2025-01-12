import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:basic_resume/presentation/presentation.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => HomeContentMobile(),
      tablet: (BuildContext context) => HomeContentTablet(),
      desktop: (BuildContext context) => HomeContentDesktop(),
    );
  }
}
