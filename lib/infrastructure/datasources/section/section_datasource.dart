import 'dart:convert';

import 'package:basic_resume/domain/domain.dart';
import 'package:basic_resume/infrastructure/infrastructure.dart';
import 'package:flutter/services.dart';

class SectionDatasource extends SectionsDatasources {
  @override
  Future<List<SectionEntity>> getSections() async {
    final response = await rootBundle.loadString('assets/db/sections.json');
    final Map<String, dynamic> data = json.decode(response);

    final sections = <SectionEntity>[];

    data.forEach((key, value) {
      sections.add(
        SectionMapper.sectionModelToEntity(SectionsResponse.fromJson(value)),
      );
    });

    return sections;
  }
}
