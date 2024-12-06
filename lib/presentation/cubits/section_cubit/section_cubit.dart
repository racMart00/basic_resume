import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:basic_resume/infrastructure/infrastructure.dart';
import 'package:basic_resume/presentation/presentation.dart';

class SectionCubit extends Cubit<SectionState> {
  final SectionDatasource sectionDatasource;

  SectionCubit(this.sectionDatasource) : super(SectionInitial());

  Future<void> fetchSections() async {
    emit(SectionLoading());
    try {
      final sections = await sectionDatasource.getSections();
            
      if (sections.isEmpty) {
        emit(SectionError('No sections available.'));
      } else {
        emit(SectionLoaded(sections));
      }
    } catch (e) {
      emit(SectionError('Failed to load sections: $e'));
    }
  }
}