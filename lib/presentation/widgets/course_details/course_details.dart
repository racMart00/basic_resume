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

        if (sizingInformation.deviceScreenType case DeviceScreenType.desktop) {
          spacing = size.height * 0.03;
        } else if (sizingInformation.deviceScreenType
            case DeviceScreenType.tablet) {
          spacing = size.height * 0.016;
        } else if (sizingInformation.deviceScreenType
            case DeviceScreenType.mobile) {
          spacing = size.height * 0.02;
        }

        var boxSize = size.height * 1.25;

        if (sizingInformation.deviceScreenType case DeviceScreenType.desktop) {
          boxSize = size.width * 0.5;
        } else if (sizingInformation.deviceScreenType
            case DeviceScreenType.tablet) {
          boxSize = size.width * 0.9;
        } else if (sizingInformation.deviceScreenType
            case DeviceScreenType.mobile) {
          boxSize = size.height * 1.25;
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
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  SizedBox(height: spacing),
                  Text(
                    'Rafael A. Castillo Martinez',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  SizedBox(height: spacing),
                  Text(
                    '''
Detail-oriented and skilled in software development. Proactive team player committed to company success. Reliable and adaptable with strong analytical and communication skills. Seeking a full-time role for growth and professional development.''',
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
