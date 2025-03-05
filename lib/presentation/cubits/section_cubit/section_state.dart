import 'package:basic_resume/domain/domain.dart';
import 'package:equatable/equatable.dart';

abstract class SectionState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SectionInitial extends SectionState {}

class SectionLoading extends SectionState {}

class SectionLoaded extends SectionState {

  SectionLoaded(this.sections);
  final List<SectionEntity> sections;

  @override
  List<Object?> get props => [sections];
}

class SectionError extends SectionState {

  SectionError(this.message);
  final String message;

  @override
  List<Object?> get props => [message];
}
