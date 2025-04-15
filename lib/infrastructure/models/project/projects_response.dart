import 'package:basic_resume/infrastructure/infrastructure.dart';

class ProjectsResponse {
  ProjectsResponse({
    required this.img,
    required this.title,
    required this.description,
    this.tags,
  });

  factory ProjectsResponse.fromJson(Map<String, dynamic> json) {
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

    return ProjectsResponse(
      img: json['img'].toString(),
      title: json['title'].toString(),
      description: json['description'].toString(),
      tags: parsedTags,
    );
  }

  final String img;
  final String title;
  final String description;
  final Map<String, TagResponse>? tags;

  Map<String, dynamic> toJson() {
    return {
      'img': img,
      'title': title,
      'description': description,
      'tags': tags?.map((key, value) => MapEntry(key, value.toJson())),
    };
  }
}
