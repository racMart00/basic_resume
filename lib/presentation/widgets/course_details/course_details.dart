import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CourseDetails extends StatelessWidget {
  const CourseDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        var spacing = size.height * 0.02;

        switch (sizingInformation.deviceScreenType) {
          case DeviceScreenType.desktop:
            spacing = size.height * 0.03;
          case DeviceScreenType.tablet:
            spacing = size.height * 0.016;
          case DeviceScreenType.mobile:
            spacing = size.height * 0.02;
          default:
        }                

        var boxSize = size.height * 1.25;

        switch (sizingInformation.deviceScreenType) {
          case DeviceScreenType.desktop:
            boxSize = size.width * 0.55;
          case DeviceScreenType.tablet:
            boxSize = size.width * 0.9;
          case DeviceScreenType.mobile:
            boxSize = size.height * 1.25;
          default:
        }

        return SizedBox(
          width: boxSize,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: spacing),
                  Text(
                    'Front-End Developer',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  SizedBox(height: spacing),
                  Text(
                    'Rafael A. Castillo Martinez',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  SizedBox(height: spacing),
                  Text(
                    'Detail-oriented and skilled in software development. Proactive team player committed to company success. Reliable and adaptable with strong analytical and communication skills. Seeking a full-time role for growth and professional development.',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
