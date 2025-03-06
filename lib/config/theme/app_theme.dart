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
      if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
        return size.width * (baseSize + 0.004);
      } else if (sizingInformation.deviceScreenType ==
          DeviceScreenType.tablet) {
        return size.width * (baseSize + 0.0035);
      } else if (sizingInformation.deviceScreenType ==
          DeviceScreenType.mobile) {
        return size.height * (baseSize + 0.004);
      } else {
        // Handle unexpected cases (e.g., null or unknown enum value)
        // You can throw an exception, return a default value,
        // or do something else.
        // Example:
        throw Exception('Invalid or null DeviceScreenType.');
        // or
        // return 0.0; // Default value
      }
    }

    final displayLargeSize = calculateDisplaySize(0.020);
    final displayMediumSize = calculateDisplaySize(0.018);
    final displaySmallSize = calculateDisplaySize(0.016);

    final titleLargeSize = calculateDisplaySize(0.014);
    final titleMediumSize = calculateDisplaySize(0.012);
    final titleSmallSize = calculateDisplaySize(0.010);

    final bodyLargeSize = calculateDisplaySize(0.008);
    final bodyMediumSize = calculateDisplaySize(0.006);
    final bodySmallSize = calculateDisplaySize(0.004);

    final color = brightness == Brightness.light
        ? const ColorScheme.light().inverseSurface
        : const ColorScheme.dark().inverseSurface;

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
          fontWeight: FontWeight.w600,
          color: color,
        ),
        titleMedium: TextStyle(
          fontSize: titleMediumSize,
          fontWeight: FontWeight.w400,
          color: color,
        ),
        titleSmall: TextStyle(
          fontSize: titleSmallSize,
          fontWeight: FontWeight.w200,
          color: color,
        ),
        bodyLarge: TextStyle(
          fontSize: bodyLargeSize,
          fontWeight: FontWeight.w400,
          color: color,
        ),
        bodyMedium: TextStyle(
          fontSize: bodyMediumSize,
          fontWeight: FontWeight.w400,
          color: color,
        ),
        bodySmall: TextStyle(
          fontSize: bodySmallSize,
          fontWeight: FontWeight.w200,
          color: color,
        ),
      ),
    );
  }
}
