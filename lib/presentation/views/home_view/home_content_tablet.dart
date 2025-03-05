import 'package:basic_resume/presentation/presentation.dart';
import 'package:flutter/material.dart';

class HomeContentTablet extends StatelessWidget {
  const HomeContentTablet({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MyAvatar(),
        SizedBox(height: size.height * 0.01),
        const CourseDetails(),
        SizedBox(height: size.height * 0.025),
        const CallToAction(),
      ],
    );
  }
}
