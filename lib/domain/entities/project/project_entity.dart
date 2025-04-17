import 'package:basic_resume/domain/domain.dart';

class ProjectEntity {
  ProjectEntity({
    required this.img,
    required this.title,
    required this.description,
    required this.isDownloadable,
    required this.websiteLink,
    this.apkDownloadLink,
    this.tags,
  });

  factory ProjectEntity.fromJson(Map<String, dynamic> json) {
    return ProjectEntity(
      img: json['img'].toString(),
      title: json['title'].toString(),
      description: json['description'].toString(),
      isDownloadable: json['isDownloadable'] as bool,
      websiteLink: json['websiteLink'].toString(),
      apkDownloadLink: json['apkDownloadLink'].toString(),
      tags: (json['tags'] as Map<String, dynamic>?)?.map(
        (key, value) =>
            MapEntry(key, TagEntity.fromJson(value as Map<String, dynamic>)),
      ),
    );
  }
  final String img;
  final String title;
  final String description;
  final bool isDownloadable;
  final String websiteLink;
  final String? apkDownloadLink;
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
