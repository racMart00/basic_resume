import 'package:flutter/material.dart';

import 'package:basic_resume/presentation/presentation.dart';

class HomeContentDesktop extends StatelessWidget {
  const HomeContentDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CourseDetails(),
        Expanded(
          child: Center(
            child: TextButton(onPressed: () {}, child: Text('Hire Me')),
          ),
        ),
      ],
    );
  }
}
