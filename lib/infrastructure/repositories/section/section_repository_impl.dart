import 'package:basic_resume/domain/domain.dart';

class SectionRepositoryImpl with SectionsRepositories {

  SectionRepositoryImpl(this.datasources);
  
  final SectionsDatasources datasources;

  @override
  Future<List<SectionEntity>> getSections() {
    return datasources.getSections();
  }
}
