import 'package:basic_resume/infrastructure/infrastructure.dart';

class SectionsResponse {
  final String title;
  final String? subtitle;
  final String? where;
  final String? date;
  final dynamic description;
  final Map<String, TagResponse>? tags;

  SectionsResponse({
    required this.title,
    this.subtitle,
    this.where,
    this.date,
    required this.description,
    this.tags,
  });

  factory SectionsResponse.fromJson(Map<String, dynamic> json) {
    return SectionsResponse(
      title: json['title'],
      subtitle: json['subtitle'],
      where: json['where'],
      date: json['date'],
      description: json['description'] is List
          ? List<String>.from(json['description'].map((x) => x.toString()))
          : json['description'],
      tags: (json['tags'] as Map<String, dynamic>?)?.map((key, value) =>
          MapEntry(key, TagResponse.fromJson(value))), // Use TagResponse
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'subtitle': subtitle,
      'where': where,
      'date': date,
      'description': description is List<String>
          ? List<dynamic>.from(description.map((x) => x))
          : description,
      'tags': tags?.map((key, value) => MapEntry(key, value.toJson())),
    };
  }
}