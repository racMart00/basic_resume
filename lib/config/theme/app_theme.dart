import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AppTheme {
  static ThemeData lightTheme(Size size, SizingInformation sizingInformation) {
    return _buildTheme(size, sizingInformation, Brightness.light);
  }

  static ThemeData darkTheme(Size size, SizingInformation sizingInformation) {
    return _buildTheme(size, sizingInformation, Brightness.dark);
  }

  static ThemeData _buildTheme(Size size, SizingInformation sizingInformation, Brightness brightness) {
    double displayLargeSize = sizingInformation.deviceScreenType == DeviceScreenType.mobile
        ? size.height * 0.06
        : size.height * 0.07;

    double displayMediumSize = sizingInformation.deviceScreenType == DeviceScreenType.mobile
        ? size.height * 0.024
        : size.height * 0.028;

    Color color = brightness == Brightness.light ? ColorScheme.light().inverseSurface : ColorScheme.dark().inverseSurface;

    return ThemeData(
      brightness: brightness,
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: displayLargeSize,
          fontWeight: FontWeight.w600,
          color: color,
        ),
        displayMedium: TextStyle(
          fontSize: displayMediumSize,
          fontWeight: FontWeight.w400,
          color: color,
        ),
      ),
    );
  }
}