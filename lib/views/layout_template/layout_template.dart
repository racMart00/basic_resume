import 'package:basic_resume/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:basic_resume/widgets/centered_view/centered_view.dart';
import 'package:basic_resume/widgets/navbar_drawer/navbar_drawer.dart';
import 'package:basic_resume/widgets/navigation_bar/custom_navbar.dart';

class LayoutTemplate extends StatelessWidget {
  const LayoutTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder:
          (context, sizingInformation) => Scaffold(
            drawer:
                sizingInformation.deviceScreenType == DeviceScreenType.mobile
                    ? NavBarDrawer()
                    : null,
            backgroundColor: Colors.white,
            body: CenteredView(
              child: Column(
                children: [
                  CustomNavBar(),
                  Expanded(
                    child: HomeView()
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
