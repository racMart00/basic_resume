import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:basic_resume/presentation/presentation.dart';

class LayoutTemplate extends StatelessWidget {
  final int pageIndex;

  const LayoutTemplate({super.key, required this.pageIndex});

  final viewRoutes = const <Widget>[HomeView(), AboutView()];

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
                    child: IndexedStack(index: pageIndex, children: viewRoutes),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
