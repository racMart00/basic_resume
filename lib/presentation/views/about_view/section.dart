import 'package:flutter/material.dart';

import 'package:basic_resume/domain/domain.dart';
import 'package:basic_resume/presentation/presentation.dart';

class Section extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? where;
  final String? date;
  final dynamic description;
  final Map<String, TagEntity>? tags;

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
        Divider(),
        if (subtitle != null) ...[
          Text(subtitle!, style: Theme.of(context).textTheme.titleMedium),
          SizedBox(height: size.height * 0.005),
        ],
        if (where != null) ...[
          Text(where!, style: Theme.of(context).textTheme.bodyMedium),
          SizedBox(height: size.height * 0.005),
        ],
        if (date != null) ...[
          Text(date!, style: Theme.of(context).textTheme.bodyMedium),
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
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        " - $desc",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(height: size.height * 0.001,)
                    ],
                  );
                }).toList(),
          ),
        ],
        SizedBox(height: size.height * 0.005),
        if (tags != null) ...[
          Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            children:
                tags!.entries.map((entry) {
                  return TagIcon(
                    tagTitle: entry.key,
                    tagColor: entry.value.color,
                    svgDir: entry.value.icon,
                    svgTitle: entry.key,
                  );
                }).toList(),
          ),
        ],
      ],
    );
  }
}
