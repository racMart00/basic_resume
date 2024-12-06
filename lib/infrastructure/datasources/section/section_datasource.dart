import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:basic_resume/domain/domain.dart';
import 'package:basic_resume/infrastructure/infrastructure.dart';

class SectionDatasource extends SectionsDatasources {
  @override
  Future<List<Section>> getSections() async {
    final String response = await rootBundle.loadString('assets/db/sections.json');
    final Map<String, dynamic> data = json.decode(response);

    List<Section> sections = [];

    data.forEach((key, value) {
      sections.add(
        SectionMapper.sectionModelToEntity(SectionsResponse.fromJson(value)),
      );
    });

    return sections;
  }
}