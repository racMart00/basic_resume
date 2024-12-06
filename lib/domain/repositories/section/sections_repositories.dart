import 'package:basic_resume/domain/domain.dart';

abstract class SectionsRepositories {
  
  Future<List<Section>> getSections();

}