import 'package:basic_resume/domain/domain.dart';

class ProjectRepositoryImpl with ProjectsRepositories {

  ProjectRepositoryImpl(this.datasources);
  
  final ProjectsDatasources datasources;

  @override
  Future<List<ProjectEntity>> getProjects() {
    return datasources.getProjects();
  }
}
