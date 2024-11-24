import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CourseDetails extends StatelessWidget {
  const CourseDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        // CrossAxisAlignment columnAlignment =
        //     sizingInformation.deviceScreenType == DeviceScreenType.desktop
        //         ? CrossAxisAlignment.start
        //         : CrossAxisAlignment.center;

        return SizedBox(
          width: size.height * 1.25,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  Text(
                    'Front-End Developer',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  SizedBox(height: size.height * 0.01),
                  Text(
                    'Rafa Martinez',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  SizedBox(height: size.height * 0.01),
                  Text(
                    'La descripción es un discurso (oral o escrito) que detalla y explica las características de un lugar, persona, animal, cosa o situación. Por ejemplo: Era un lugar enorme, muy luminoso y con una vista privilegiada.',
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