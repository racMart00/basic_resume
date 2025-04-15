import 'package:basic_resume/domain/domain.dart';
import 'package:equatable/equatable.dart';

abstract class ProjectState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProjectInitial extends ProjectState {}

class ProjectLoading extends ProjectState {}

class ProjectLoaded extends ProjectState {

  ProjectLoaded(this.projects);
  final List<ProjectEntity> projects;

  @override
  List<Object?> get props => [projects];
}

class ProjectError extends ProjectState {

  ProjectError(this.message);
  final String message;

  @override
  List<Object?> get props => [message];
}
