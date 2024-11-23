import 'package:flutter/material.dart';

import 'package:basic_resume/presentation/presentation.dart';

class HomeContentMobile extends StatelessWidget {
  const HomeContentMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CourseDetails(),
        SizedBox(height: 60),
        CallToAction(title: 'Join Course'),
      ],
    );
  }
}
