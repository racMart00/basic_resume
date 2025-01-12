import 'package:flutter/material.dart';

import 'package:basic_resume/presentation/presentation.dart';

class HomeContentTablet extends StatelessWidget {
  const HomeContentTablet({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyAvatar(),
        SizedBox(height: size.height * 0.01),
        CourseDetails(),
        SizedBox(height: size.height * 0.025),
        CallToAction(),
      ],
    );
  }
}