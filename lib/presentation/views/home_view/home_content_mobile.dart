import 'package:flutter/material.dart';

import 'package:basic_resume/presentation/presentation.dart';

class HomeContentMobile extends StatelessWidget {
  const HomeContentMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CourseDetails(),
          SizedBox(height: 60),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(
                    Colors.deepPurple.shade600,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric( horizontal: 12, vertical: 6),
                  child: Text(
                    'Hire Me',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(
                    Theme.of(context).colorScheme.inverseSurface,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric( horizontal: 12, vertical: 6),
                  child: Text(
                    'My work',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.surface,
                      fontSize: 18,
                      fontWeight: FontWeight.w800
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
