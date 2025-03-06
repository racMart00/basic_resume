import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MyAvatar extends StatelessWidget {
  const MyAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        var boxSize = size.width * 1.25;

        if (sizingInformation.deviceScreenType case DeviceScreenType.desktop) {
          boxSize = size.width * 0.3;
        } else if (sizingInformation.deviceScreenType
            case DeviceScreenType.tablet) {
          boxSize = size.width * 0.35;
        } else if (sizingInformation.deviceScreenType
            case DeviceScreenType.mobile) {
          boxSize = size.width * 0.55;
        }

        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: boxSize,
              height: boxSize,
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 4),
                image: const DecorationImage(
                  image: AssetImage('assets/images/avatar.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.inverseSurface,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.linked_camera_rounded,
                        size: 30,
                        color: Theme.of(context).colorScheme.surface,
                      ),
                      onPressed: () {},
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(width: 100),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.linked_camera_rounded,
                        size: 30,
                        color: Theme.of(context).colorScheme.inverseSurface,
                      ),
                      onPressed: () {},
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
