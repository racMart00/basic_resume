import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:basic_resume/presentation/presentation.dart';

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
