import 'package:flutter/material.dart';

import 'package:basic_resume/presentation/presentation.dart';

class HomeContentMobile extends StatelessWidget {
  const HomeContentMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyAvatar(),
        CourseDetails(),
        SizedBox(height: size.height * 0.03),
        CallToAction(),
      ],
    );
  }
}