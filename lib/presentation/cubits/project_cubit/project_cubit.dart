import 'package:basic_resume/infrastructure/infrastructure.dart';
import 'package:basic_resume/presentation/presentation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectCubit extends Cubit<ProjectState> {
  ProjectCubit(this.sectionDatasource) : super(ProjectInitial());
  final ProjectDatasource sectionDatasource;

  Future<void> fetchProjects() async {
    emit(ProjectLoading());
    try {
      final projects = await sectionDatasource.getProjects();

      if (projects.isEmpty) {
        emit(ProjectError('No sections available.'));
      } else {
        emit(ProjectLoaded(projects));
      }
    } on Exception catch (e) {
      emit(ProjectError('Failed to load sections: $e'));
    }
  }
}
