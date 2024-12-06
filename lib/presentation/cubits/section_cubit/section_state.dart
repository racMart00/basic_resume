import 'package:equatable/equatable.dart';

import 'package:basic_resume/domain/domain.dart';

abstract class SectionState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SectionInitial extends SectionState {}

class SectionLoading extends SectionState {}

class SectionLoaded extends SectionState {
  final List<Section> sections;

  SectionLoaded(this.sections);

  @override
  List<Object?> get props => [sections];
}

class SectionError extends SectionState {
  final String message;

  SectionError(this.message);

  @override
  List<Object?> get props => [message];
}