import 'package:flutter/material.dart';
import 'package:basic_resume/presentation/presentation.dart';

class Section extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? where;
  final String? date;
  final dynamic description;
  final String? tags;

  const Section({
    super.key,
    required this.title,
    this.subtitle,
    this.where,
    this.date,
    required this.description,
    this.tags,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleLarge),
        SizedBox(height: size.height * 0.005),
        if (subtitle != null) ...[
          Text(subtitle!, style: Theme.of(context).textTheme.titleMedium),
          SizedBox(height: size.height * 0.005),
        ],
        if (where != null) ...[
          Text(where!, style: Theme.of(context).textTheme.titleMedium),
          SizedBox(height: size.height * 0.005),
        ],
        if (date != null) ...[
          Text(date!, style: Theme.of(context).textTheme.titleMedium),
          SizedBox(height: size.height * 0.005),
        ],
        if (description is String) ...[
          Text(
            description as String,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ] else if (description is List<String>) ...[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
                (description as List<String>).map((desc) {
                  return Text(
                    desc,
                    style: Theme.of(context).textTheme.titleSmall,
                  );
                }).toList(),
          ),
        ],
        SizedBox(height: size.height * 0.005),
        if (tags != null) ...[
          Text(tags!, style: Theme.of(context).textTheme.titleMedium),
          SizedBox(height: size.height * 0.005),
        ],

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TagIcon(
              tagTitle: 'Flutter',
              tagColor: Colors.blue.shade800,
              svgDir: 'assets/images/dev_icons/flutter.svg',
              svgTitle: 'Flutter',
            ),
            SizedBox(width: size.width * 0.005),
            TagIcon(
              tagTitle: 'Java',
              tagColor: Colors.blue.shade700,
              svgDir: 'assets/images/dev_icons/java1.svg',
              svgTitle: 'Java',
            ),
            SizedBox(width: size.width * 0.005),
            TagIcon(
              tagTitle: 'JS',
              tagColor: Colors.blue.shade600,
              svgDir: 'assets/images/dev_icons/js.svg',
              svgTitle: 'Java Script',
            ),
          ],
        ),
      ],
    );
  }
}
