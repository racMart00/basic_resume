import 'dart:convert';
import 'package:basic_resume/domain/domain.dart';
import 'package:basic_resume/infrastructure/infrastructure.dart';
import 'package:flutter/services.dart';

class ProjectDatasource {
  Future<List<ProjectEntity>> getProjects() async {
    final response = await rootBundle.loadString('assets/db/projects.json');
    final dynamic decodedData = json.decode(response);

    final data = decodedData as Map<String, dynamic>;

    final projectsData = data['my_work'] as List<dynamic>;

    final projects = <ProjectEntity>[];

    for (final dynamic projectData in projectsData) {
      projects.add(
        ProjectMapper.projectModelToEntity(
          ProjectsResponse.fromJson(projectData as Map<String, dynamic>),
        ),
      );
    }

    return projects;
  }
}
