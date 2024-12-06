import 'package:basic_resume/domain/domain.dart';

class SectionRepositoryImpl extends SectionsRepositories {
  
  final SectionsDatasources datasources;

  SectionRepositoryImpl(this.datasources);

  @override
  Future<List<Section>> getSections() {
    return datasources.getSections();
  }
}