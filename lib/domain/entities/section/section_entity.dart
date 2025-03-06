import 'package:basic_resume/domain/domain.dart';

class SectionEntity {
  SectionEntity({
    required this.title,
    required this.description,
    this.subtitle,
    this.where,
    this.date,
    this.tags,
  });

  factory SectionEntity.fromJson(Map<String, dynamic> json) {
    return SectionEntity(
      title: json['title'].toString(),
      subtitle: json['subtitle'].toString(),
      where: json['where'].toString(),
      date: json['date'].toString(),
      description: json['description'],
      tags: (json['tags'] as Map<String, dynamic>?)?.map(
        (key, value) =>
            MapEntry(key, TagEntity.fromJson(value as Map<String, dynamic>)),
      ),
    );
  }
  final String title;
  final String? subtitle;
  final String? where;
  final String? date;
  final dynamic description;
  final Map<String, TagEntity>? tags;

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
