import 'dart:io';
import 'package:basic_resume/presentation/presentation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LayoutTemplate extends StatelessWidget {
  const LayoutTemplate({required this.pageIndex, super.key});
  final int pageIndex;

  List<Widget> get viewRoutes => const [HomeView(), AboutView()];

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;

    final Widget mainContent = Padding(
      padding:
          EdgeInsets.only(top: !kIsWeb && Platform.isAndroid ? topPadding : 0),
      child: CenteredView(
        child: Column(
          children: [
            const CustomNavBar(),
            Expanded(
              child: IndexedStack(index: pageIndex, children: viewRoutes),
            ),
          ],
        ),
      ),
    );

    final currentBrightness = Theme.of(context).brightness == Brightness.light
        ? Brightness.dark
        : Brightness.light;

    final overlayStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: currentBrightness,
      systemNavigationBarIconBrightness: currentBrightness,
    );

    return ResponsiveBuilder(
      builder: (context, sizingInformation) =>
          AnnotatedRegion<SystemUiOverlayStyle>(
        value: overlayStyle,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          extendBody: true,
          drawer: sizingInformation.deviceScreenType == DeviceScreenType.mobile
              ? const NavBarDrawer()
              : null,
          body: mainContent,
        ),
      ),
    );
  }
}
