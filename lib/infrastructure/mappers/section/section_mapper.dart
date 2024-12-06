import 'package:basic_resume/domain/domain.dart';
import 'package:basic_resume/infrastructure/infrastructure.dart';

class SectionMapper {
  
  static Section sectionModelToEntity(SectionsResponse model) => Section(
    title: model.title,
    subtitle: model.subtitle,
    where: model.where,
    date: model.date,
    description: model.description,
    tags: model.tags,
  );
  
}