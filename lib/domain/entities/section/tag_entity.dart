import 'package:flutter/material.dart';

class TagEntity {

  factory TagEntity.fromJson(Map<String, dynamic> json) {
    return TagEntity(
      icon: json['icon'],
      color: json['color'],
    );
  }

  TagEntity({
    required this.icon,
    required this.color,
  });
  final String icon;
  final Color color;

  Map<String, dynamic> toJson() {
    return {
      'icon': icon,
      'color': color,
    };
  }
}
