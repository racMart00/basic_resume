import 'package:basic_resume/domain/domain.dart';
import 'package:basic_resume/infrastructure/infrastructure.dart';

class ProjectMapper {
  static ProjectEntity projectModelToEntity(ProjectsResponse model) =>
      ProjectEntity(
        img: model.img,
        title: model.title,
        description: model.description,
        tags: model.tags?.map(
            (key, value) => MapEntry(key, TagMapper.tagModelToEntity(value)),),
      );
}
