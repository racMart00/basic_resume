import 'package:flutter/material.dart';

class TagEntity {

  TagEntity({
    required this.icon,
    required this.color,
  });

  factory TagEntity.fromJson(Map<String, dynamic> json) {
    return TagEntity(
      icon: json['icon'] as String,
      color: json['color'] as Color,
    );
  }
  final String icon;
  final Color color;

  Map<String, dynamic> toJson() {
    return {
      'icon': icon,
      'color': color,
    };
  }
}
