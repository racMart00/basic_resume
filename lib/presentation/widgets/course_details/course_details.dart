import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CourseDetails extends StatelessWidget {
  const CourseDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        CrossAxisAlignment columnAlignment =
            sizingInformation.deviceScreenType == DeviceScreenType.desktop
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center;

        double titleSize =
            sizingInformation.deviceScreenType == DeviceScreenType.mobile
                ? 50
                : 60;

        double descriptionSize =
            sizingInformation.deviceScreenType == DeviceScreenType.mobile
                ? 16
                : 21;

        return SizedBox(
          width: 600,
          child: Column(
            crossAxisAlignment: columnAlignment,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hi, My name is ____',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  height: 0.9,
                  fontSize: titleSize,
                ),
              ),
              SizedBox(height: 30),
              Text(
                'La descripción es un discurso (oral o escrito) que detalla y explica las características de un lugar, persona, animal, cosa o situación. Por ejemplo: Era un lugar enorme, muy luminoso y con una vista privilegiada.',
                style: TextStyle(fontSize: descriptionSize, height: 1.7),
              ),
            ],
          ),
        );
      },
    );
  }
}
