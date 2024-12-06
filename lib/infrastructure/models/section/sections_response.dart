class SectionsResponse {
  final String title;
  final String? subtitle;
  final String? where;
  final String? date;
  final dynamic description;
  final List<String>? tags;

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
      description:
          json['description'] is List
              ? List<String>.from(json['description'].map((x) => x.toString()))
              : json['description'],
      tags:
          json['tags'] != null
              ? List<String>.from(json['tags'].map((x) => x.toString()))
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'subtitle': subtitle,
      'where': where,
      'date': date,
      'description':
          description is List<String>
              ? List<dynamic>.from(description.map((x) => x))
              : description,
      'tags': tags != null ? List<dynamic>.from(tags!.map((x) => x)) : null,
    };
  }
}
