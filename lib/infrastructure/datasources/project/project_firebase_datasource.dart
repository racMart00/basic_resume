// import 'dart:convert';
import 'package:basic_resume/domain/domain.dart';
import 'package:basic_resume/infrastructure/infrastructure.dart';
// import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProjectFirebaseDatasource {
  Future<List<ProjectEntity>> getProjects() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('my_work').get();

    final projects = <ProjectEntity>[];

    for (final doc in snapshot.docs) {
      final data = doc.data();
      projects.add(
        ProjectMapper.projectModelToEntity(
          ProjectsResponse.fromJson(data),
        ),
      );
    }

    return projects;
  }
}
