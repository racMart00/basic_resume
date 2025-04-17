import 'package:basic_resume/domain/domain.dart';
import 'package:basic_resume/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    required this.img,
    required this.title,
    required this.description,
    required this.isDownloadable,
    required this.websiteLink,
    this.apkDownloadLink,
    this.tags,
    super.key,
  });

  final String img;
  final String title;
  final String description;
  final bool isDownloadable;
  final String websiteLink;
  final String? apkDownloadLink;
  final Map<String, TagEntity>? tags;

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      debugPrint('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return Card(
          elevation: 8,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        img,
                        fit: BoxFit.fill,
                        alignment: Alignment.topLeft,
                      ),
                    ),
                  ),
                  if (isDownloadable)
                    Positioned(
                      bottom: 8,
                      left: 8,
                      child: ElevatedButton(
                        onPressed: () {
                          if (apkDownloadLink != null &&
                              apkDownloadLink!.isNotEmpty) {
                            _launchURL(apkDownloadLink!);
                          } else {
                            debugPrint('No download link provided for $title');
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: const Size(40, 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Icon(Icons.download, size: 30),
                      ),
                    ),
                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: ElevatedButton(
                      onPressed: () {
                        _launchURL(websiteLink);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(40, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Icon(Icons.link, size: 30),
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.01),
              Text(
                title,
                style: getFontTextStyle(
                  'title',
                  sizingInformation,
                  context,
                ),
              ),
              SizedBox(height: size.height * 0.01),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.height * 0.02),
                child: Text(
                  description,
                  textAlign: TextAlign.justify,
                  style: getFontTextStyle(
                    'description',
                    sizingInformation,
                    context,
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.01),
              if (tags != null) ...[
                Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: tags!.entries.map((entry) {
                    return TagIcon(
                      tagTitle: Text(
                        entry.key,
                        style: getFontTextStyle(
                          'tags',
                          sizingInformation,
                          context,
                        ),
                      ),
                      tagColor: entry.value.color,
                      svgDir: entry.value.icon,
                      svgTitle: entry.key,
                    );
                  }).toList(),
                ),
              ],
              SizedBox(height: size.height * 0.01),
            ],
          ),
        );
      },
    );
  }
}
