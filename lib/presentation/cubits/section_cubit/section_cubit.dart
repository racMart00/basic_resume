import 'package:basic_resume/infrastructure/infrastructure.dart';
import 'package:basic_resume/presentation/presentation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SectionCubit extends Cubit<SectionState> {

  SectionCubit(this.sectionDatasource) : super(SectionInitial());
  final SectionDatasource sectionDatasource;

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
