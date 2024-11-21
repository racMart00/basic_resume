import 'package:basic_resume/widgets/call_to_action/call_to_action.dart';
import 'package:basic_resume/widgets/centered_view/centered_view.dart';
import 'package:basic_resume/widgets/course_details/course_details.dart';
import 'package:flutter/material.dart';

import 'package:basic_resume/widgets/navigation_bar/navigation_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CenteredView(
        child: Column(
          children: [
            CustomNavBar(),
            Expanded(
              child: Row(
                children: [
                  CourseDetails(),
                  Expanded(
                    child: Center(child: CallToAction(title: 'Join Course')),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
