import 'package:basic_resume/domain/domain.dart';
import 'package:basic_resume/infrastructure/infrastructure.dart';

class SectionMapper {
  
  static SectionEntity sectionModelToEntity(SectionsResponse model) => SectionEntity(
    title: model.title,
    subtitle: model.subtitle,
    where: model.where,
    date: model.date,
    description: model.description,
    tags: model.tags?.map((key, value) => MapEntry(key, tagModelToEntity(value))),
  );

  static TagEntity tagModelToEntity(TagResponse model) => TagEntity(
    icon: model.icon,
    color: model.color,
  );
}