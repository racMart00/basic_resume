import 'package:basic_resume/widgets/call_to_action/call_to_action.dart';
import 'package:basic_resume/widgets/course_details/course_details.dart';
import 'package:flutter/material.dart';

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
