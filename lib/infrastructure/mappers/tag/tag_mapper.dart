import 'package:basic_resume/domain/domain.dart';
import 'package:basic_resume/infrastructure/infrastructure.dart';

class TagMapper {
  static TagEntity tagModelToEntity(TagResponse model) => TagEntity(
        icon: model.icon,
        color: model.color,
      );
}
