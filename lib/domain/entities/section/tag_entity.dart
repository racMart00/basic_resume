import 'package:flutter/material.dart';

class TagEntity {
  final String icon;
  final Color color;

  TagEntity({
    required this.icon,
    required this.color,
  });

  factory TagEntity.fromJson(Map<String, dynamic> json) {
    return TagEntity(
      icon: json['icon'],
      color: json['color'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'icon': icon,
      'color': color,
    };
  }
}