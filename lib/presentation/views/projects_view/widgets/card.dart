import 'package:basic_resume/domain/domain.dart';
import 'package:basic_resume/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    required this.img,
    required this.title,
    required this.description,
    super.key,
    this.tags,
  });

  final String img;
  final String title;
  final String description;
  final Map<String, TagEntity>? tags;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return Card(
          child: Column(
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
              Text(
                description,
                style: getFontTextStyle(
                  'description',
                  sizingInformation,
                  context,
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
