import 'package:basic_resume/domain/domain.dart';

class ProjectEntity {
  ProjectEntity({
    required this.img,
    required this.title,
    required this.description,
    this.tags,
  });

  factory ProjectEntity.fromJson(Map<String, dynamic> json) {
    return ProjectEntity(
      img: json['img'].toString(),
      title: json['title'].toString(),
      description: json['description'].toString(),
      tags: (json['tags'] as Map<String, dynamic>?)?.map(
        (key, value) =>
            MapEntry(key, TagEntity.fromJson(value as Map<String, dynamic>)),
      ),
    );
  }
  final String img;
  final String title;
  final String description;
  final Map<String, TagEntity>? tags;

  Map<String, dynamic> toJson() {
    return {
      'img': img,
      'title': title,
      'description': description,
      'tags': tags?.map((key, value) => MapEntry(key, value.toJson())),
    };
  }
}
