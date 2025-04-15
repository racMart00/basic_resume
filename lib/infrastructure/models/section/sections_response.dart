import 'package:basic_resume/infrastructure/infrastructure.dart';

class SectionsResponse {
  SectionsResponse({
    required this.title,
    required this.description,
    this.subtitle,
    this.where,
    this.date,
    this.tags,
  });

  factory SectionsResponse.fromJson(Map<String, dynamic> json) {
    dynamic parsedDescription;
    final rawDescription = json['description'];

    if (rawDescription is List) {
      parsedDescription = List<String>.from(
        rawDescription.map((x) => x.toString()),
      );
    } else if (rawDescription is String) {
      parsedDescription = rawDescription;
    } else {
      parsedDescription = null;
    }

    Map<String, TagResponse>? parsedTags;
    final rawTags = json['tags'];
    if (rawTags is Map<String, dynamic>) {
      parsedTags = rawTags.map((key, value) {
        if (value is Map<String, dynamic>) {
          return MapEntry(key, TagResponse.fromJson(value));
        } else {
          return MapEntry(
              key, TagResponse.fromJson(value as Map<String, dynamic>),);
        }
      });
    }

    return SectionsResponse(
      title: json['title']?.toString() ?? 'Untitled Section',
      subtitle: json['subtitle'] as String?,
      where: json['where'] as String?,
      date: json['date'] as String?,
      description: parsedDescription,
      tags: parsedTags,
    );
  }

  final String title;
  final String? subtitle;
  final String? where;
  final String? date;
  final dynamic description;
  final Map<String, TagResponse>? tags;

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'subtitle': subtitle,
      'where': where,
      'date': date,
      'description': description,
      'tags': tags?.map((key, value) => MapEntry(key, value.toJson())),
    };
  }
}
