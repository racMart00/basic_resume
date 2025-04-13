import 'package:basic_resume/infrastructure/infrastructure.dart';

class SectionsResponse {
  SectionsResponse({
    required this.title,
    required this.description, this.subtitle,
    this.where,
    this.date,
    this.tags,
  });

  factory SectionsResponse.fromJson(Map<String, dynamic> json) {
    return SectionsResponse(
      title: json['title'].toString(),
      subtitle: json['subtitle'].toString(),
      where: json['where'].toString(),
      date: json['date'].toString(),
      description: json['description'] is List
          ? List<String>.from(
              (json['description'] as List<dynamic>).map((x) => x.toString()),
            )
          : [json['description'].toString()],
      tags: (json['tags'] as Map<String, dynamic>?)?.map(
        (key, value) =>
            MapEntry(key, TagResponse.fromJson(value as Map<String, dynamic>)),
      ), // Use TagResponse
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
      'description': description is List<String>
        ? (description as List<String>).map((x) => x).toList()
        : description,
      'tags': tags?.map((key, value) => MapEntry(key, value.toJson())),
    };
  }
}
