import 'package:basic_resume/presentation/presentation.dart';
import 'package:flutter/material.dart';

class HomeViewDesktop extends StatelessWidget {
  const HomeViewDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CourseDetails(),
            SizedBox(height: size.height * 0.05),
            const CallToAction(),
          ],
        ),
        SizedBox(width: size.height * 0.025),
        const MyAvatar(),
      ],
    );
  }
}
