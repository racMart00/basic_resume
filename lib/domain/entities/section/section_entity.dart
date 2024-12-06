import 'package:basic_resume/domain/domain.dart';

class SectionEntity {
  final String title;
  final String? subtitle;
  final String? where;
  final String? date;
  final dynamic description;
  final Map<String, TagEntity>? tags;

  SectionEntity({
    required this.title,
    this.subtitle,
    this.where,
    this.date,
    required this.description,
    this.tags,
  });

  factory SectionEntity.fromJson(Map<String, dynamic> json) {
    return SectionEntity(
      title: json['title'],
      subtitle: json['subtitle'],
      where: json['where'],
      date: json['date'],
      description: json['description'],
      tags: (json['tags'] as Map<String, dynamic>?)?.map((key, value) =>
          MapEntry(key, TagEntity.fromJson(value))),
    );
  }

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