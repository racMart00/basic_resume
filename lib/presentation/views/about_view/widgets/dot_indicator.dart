import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    required this.currentIndex,
    required this.dotCount,
    super.key,
  });
  final int currentIndex;
  final int dotCount;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        double activeDotSize;
        double inactiveDotSize;

        if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
          activeDotSize = 10.0;
          inactiveDotSize = 8.0;
        } else if (sizingInformation.deviceScreenType ==
            DeviceScreenType.tablet) {
          activeDotSize = 9.0;
          inactiveDotSize = 7.0;
        } else {
          activeDotSize = 8.0;
          inactiveDotSize = 6.0;
        }

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(dotCount, (index) {
            final isActive = currentIndex == index;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
              margin: const EdgeInsets.symmetric(horizontal: 3),
              width: isActive ? activeDotSize : inactiveDotSize,
              height: isActive ? activeDotSize : inactiveDotSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isActive
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
              ),
            );
          }),
        );
      },
    );
  }
}
