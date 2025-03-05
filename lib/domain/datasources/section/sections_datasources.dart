import 'package:basic_resume/domain/domain.dart';

abstract class SectionsDatasources {
  
  Future<List<SectionEntity>> getSections();

}
