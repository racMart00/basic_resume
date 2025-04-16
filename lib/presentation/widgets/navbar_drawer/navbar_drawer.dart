import 'package:basic_resume/presentation/presentation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

class NavBarDrawer extends StatelessWidget {
  const NavBarDrawer({super.key});

  Future<void> _handleDownload(Uri url) async {
    if (!await launchUrl(
      url,
    )) {
      debugPrint('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final apkDownloadUri = Uri.parse('https://drive.google.com/uc?export=download&id=1UaghPTuFYdqmb_YE_5PEzKJe7yWTs1ee');

    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return Container(
          width: size.width * 0.5,
          color: Theme.of(context).colorScheme.surface,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NavBarDrawerHeader(),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.025,
                    vertical: size.height * 0.02,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const NavBarItem(
                        title: 'Home',
                        icon: Icons.home_filled,
                        path: '/0',
                      ),
                      SizedBox(height: size.height * 0.02),
                      const NavBarItem(
                        title: 'About',
                        icon: Icons.account_circle_rounded,
                        path: '/1',
                      ),
                      SizedBox(height: size.height * 0.02),
                      const NavBarItem(
                        title: 'My Work',
                        icon: Icons.shopping_bag,
                        path: '/2',
                      ),
                      SizedBox(height: size.height * 0.02),
                      const Spacer(),
                      GestureDetector(
                        onTap: () => _handleDownload(apkDownloadUri),
                        child: MouseRegion(
                          cursor: kIsWeb
                              ? SystemMouseCursors.click
                              : SystemMouseCursors.basic,
                          child: TagIcon(
                            tagTitle: Text(
                              "Hi! I'm_racMart.apk",
                              style: getFontTextStyle(
                                'description',
                                sizingInformation,
                                context,
                              ),
                            ),
                            tagColor: Colors.deepPurpleAccent.shade200,
                            svgDir: 'assets/icons/download.svg',
                            svgTitle: 'Apk Download',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
