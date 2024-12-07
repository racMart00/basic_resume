import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AppTheme {
  static ThemeData lightTheme(Size size, SizingInformation sizingInformation) {
    return _buildTheme(size, sizingInformation, Brightness.light);
  }

  static ThemeData darkTheme(Size size, SizingInformation sizingInformation) {
    return _buildTheme(size, sizingInformation, Brightness.dark);
  }

  static ThemeData _buildTheme(
    Size size,
    SizingInformation sizingInformation,
    Brightness brightness,
  ) {
    double calculateDisplaySize(double baseSize) {
      switch (sizingInformation.deviceScreenType) {
        case DeviceScreenType.desktop:
          return size.height *
              (baseSize + 0.01);
        case DeviceScreenType.tablet:
          return size.height * baseSize;
        case DeviceScreenType.mobile:
        default:
          return size.height * (baseSize + 0.004);
      }
    }

    double displayLargeSize = calculateDisplaySize(0.022);
    double displayMediumSize = calculateDisplaySize(0.020);
    double displaySmallSize = calculateDisplaySize(0.018);

    double titleLargeSize = calculateDisplaySize(0.016);
    double titleMediumSize = calculateDisplaySize(0.014);
    double titleSmallSize = calculateDisplaySize(0.012);

    double bodyLargeSize = calculateDisplaySize(0.010);
    double bodyMediumSize = calculateDisplaySize(0.008);
    double bodySmallSize = calculateDisplaySize(0.006);

    Color color =
        brightness == Brightness.light
            ? ColorScheme.light().inverseSurface
            : ColorScheme.dark().inverseSurface;

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
        displaySmall: TextStyle(
          fontSize: displaySmallSize,
          fontWeight: FontWeight.w200,
          color: color,
        ),
        titleLarge: TextStyle(
          fontSize: titleLargeSize,
          fontWeight: FontWeight.bold,
          color: color,
        ),
        titleMedium: TextStyle(
          fontSize: titleMediumSize,
          fontWeight: FontWeight.w500,
          color: color,
        ),
        titleSmall: TextStyle(
          fontSize: titleSmallSize,
          fontWeight: FontWeight.w400,
          color: color,
        ),
        bodyLarge: TextStyle(
          fontSize: bodyLargeSize,
          fontWeight: FontWeight.bold,
          color: color,
        ),
        bodyMedium: TextStyle(
          fontSize: bodyMediumSize,
          fontWeight: FontWeight.w500,
          color: color,
        ),
        bodySmall: TextStyle(
          fontSize: bodySmallSize,
          fontWeight: FontWeight.w400,
          color: color,
        ),
      ),
    );
  }
}
