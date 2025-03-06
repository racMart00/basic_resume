import 'package:basic_resume/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LayoutTemplate extends StatelessWidget {
  const LayoutTemplate({required this.pageIndex, super.key});
  final int pageIndex;

  // Instead of a field initializer, we use a getter:
  List<Widget> get viewRoutes => const [HomeView(), AboutView()];

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        drawer: sizingInformation.deviceScreenType == DeviceScreenType.mobile
            ? const NavBarDrawer()
            : null,
        body: CenteredView(
          child: Column(
            children: [
              const CustomNavBar(),
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
