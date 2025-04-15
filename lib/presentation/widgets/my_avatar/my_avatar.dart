import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

class MyAvatar extends StatelessWidget {
  const MyAvatar({super.key});

  Future<void> _launchURL(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      debugPrint('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const borderColor = Colors.white54;

    final githubUri = Uri.parse('https://github.com/racMart00');
    final linkedinUri = Uri.parse('https://linkedin.com/in/racmart/');

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
                color: Colors.grey,
                shape: BoxShape.circle,
                border: Border.all(color: borderColor, width: 4),
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
                  GestureDetector(
                    onTap: () => _launchURL(githubUri),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: borderColor,
                          width: 2,
                        ),
                        image: const DecorationImage(
                          image: AssetImage(
                              'assets/icons/social_media/github.png',),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 60),
                  GestureDetector(
                    onTap: () => _launchURL(linkedinUri),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: borderColor,
                          width: 2,
                        ),
                        image: const DecorationImage(
                          image: AssetImage(
                              'assets/icons/social_media/linkedin.png',),
                          fit: BoxFit.cover,
                        ),
                      ),
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
