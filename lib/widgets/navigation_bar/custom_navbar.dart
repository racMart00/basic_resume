import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:basic_resume/widgets/navigation_bar/custom_navbar_mobile.dart';
import 'package:basic_resume/widgets/navigation_bar/custom_navbar_tablet_desktop.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => CustomNavBarMobile(),
      tablet: (BuildContext context) => CustomNavBarTabletDesktop(),
    );
  }
}
