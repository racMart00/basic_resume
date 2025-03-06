import 'dart:convert';
import 'package:basic_resume/domain/domain.dart';
import 'package:basic_resume/infrastructure/infrastructure.dart';
import 'package:flutter/services.dart';

class SectionDatasource with SectionsDatasources {
  @override
  Future<List<SectionEntity>> getSections() async {
    final response = await rootBundle.loadString('assets/db/sections.json');
    final dynamic decodedData = json.decode(response);
    final data = decodedData as Map<String, dynamic>;

    final sections = <SectionEntity>[];

    data.forEach((key, dynamic value) {
      sections.add(
        SectionMapper.sectionModelToEntity(
          SectionsResponse.fromJson(value as Map<String, dynamic>),
        ),
      );
    });

    return sections;
  }
}
