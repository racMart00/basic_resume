class Section {
  final String title;
  final String? subtitle;
  final String? where;
  final String? date;
  final dynamic description;
  final List<String>? tags;

  Section({
    required this.title,
    this.subtitle,
    this.where,
    this.date,
    required this.description,
    this.tags,
  });
}