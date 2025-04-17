import 'package:basic_resume/domain/domain.dart';
import 'package:basic_resume/infrastructure/infrastructure.dart';

class ProjectMapper {
  static ProjectEntity projectModelToEntity(ProjectsResponse model) =>
      ProjectEntity(
        img: model.img,
        title: model.title,
        description: model.description,
        isDownloadable: model.isDownloadable,
        websiteLink: model.websiteLink,
        apkDownloadLink: model.apkDownloadLink,
        tags: model.tags?.map(
            (key, value) => MapEntry(key, TagMapper.tagModelToEntity(value)),),
      );
}
