import 'package:flutter/material.dart';

class TagResponse {
  final String icon;
  final Color color;

  TagResponse({
    required this.icon,
    required this.color,
  });

  factory TagResponse.fromJson(Map<String, dynamic> json) {
    return TagResponse(
      icon: json['icon'],
      color: _colorFromString(json['color']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'icon': icon,
      'color': _colorToString(color),
    };
  }

  static Color _colorFromString(String colorString) {
    final parts = colorString.split(',').map(int.parse).toList();
    return Color.fromARGB(parts[0], parts[1], parts[2], parts[3]);
  }

  static String _colorToString(Color color) {
    return '${color.a},${color.r},${color.g},${color.b}';
  }
}