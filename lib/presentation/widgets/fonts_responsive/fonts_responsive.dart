import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

TextStyle? getFontTextStyle(
  String sectionName,
  SizingInformation sizingInformation,
  BuildContext context,
) {
  TextStyle? textStyle;

  switch (sectionName) {
    case 'title':
      if (sizingInformation.deviceScreenType case DeviceScreenType.desktop) {
        textStyle = Theme.of(context).textTheme.titleMedium;
      } else if (sizingInformation.deviceScreenType
          case DeviceScreenType.tablet) {
        textStyle = Theme.of(context).textTheme.displayMedium;
      } else {
        textStyle = Theme.of(context).textTheme.displayMedium;
      }
    case 'subtitle':
      if (sizingInformation.deviceScreenType case DeviceScreenType.desktop) {
        textStyle = Theme.of(context).textTheme.titleSmall;
      } else if (sizingInformation.deviceScreenType
          case DeviceScreenType.tablet) {
        textStyle = Theme.of(context).textTheme.titleSmall;
      } else {
        textStyle = Theme.of(context).textTheme.titleSmall;
      }
    case 'where':
      if (sizingInformation.deviceScreenType case DeviceScreenType.desktop) {
        textStyle = Theme.of(context).textTheme.bodyMedium;
      } else if (sizingInformation.deviceScreenType
          case DeviceScreenType.tablet) {
        textStyle = Theme.of(context).textTheme.bodyLarge;
      } else {
        textStyle = Theme.of(context).textTheme.bodyLarge;
      }
    case 'date':
      if (sizingInformation.deviceScreenType case DeviceScreenType.desktop) {
        textStyle = Theme.of(context).textTheme.bodySmall;
      } else if (sizingInformation.deviceScreenType
          case DeviceScreenType.tablet) {
        textStyle = Theme.of(context).textTheme.bodyMedium;
      } else {
        textStyle = Theme.of(context).textTheme.bodyMedium;
      }
    case 'description':
      if (sizingInformation.deviceScreenType case DeviceScreenType.desktop) {
        textStyle = Theme.of(context).textTheme.bodyLarge;
      } else if (sizingInformation.deviceScreenType
          case DeviceScreenType.tablet) {
        textStyle = Theme.of(context).textTheme.titleSmall;
      } else {
        textStyle = Theme.of(context).textTheme.displaySmall;
      }
    case 'tags':
      if (sizingInformation.deviceScreenType case DeviceScreenType.desktop) {
        final textTheme = Theme.of(context).textTheme.bodyLarge!;
        textStyle = TextStyle(
          color: Colors.white,
          fontFamily: textTheme.fontFamily,
          fontStyle: textTheme.fontStyle,
          fontSize: textTheme.fontSize,
        );
      } else if (sizingInformation.deviceScreenType
          case DeviceScreenType.tablet) {
        final textTheme = Theme.of(context).textTheme.titleSmall!;
        textStyle = TextStyle(
          color: Colors.white,
          fontFamily: textTheme.fontFamily,
          fontStyle: textTheme.fontStyle,
          fontSize: textTheme.fontSize,
        );
      } else {
        final textTheme = Theme.of(context).textTheme.titleMedium!;
        textStyle = TextStyle(
          color: Colors.white,
          fontFamily: textTheme.fontFamily,
          fontStyle: textTheme.fontStyle,
          fontSize: textTheme.fontSize,
        );
      }
    default:
      if (sizingInformation.deviceScreenType case DeviceScreenType.desktop) {
        textStyle = Theme.of(context).textTheme.displayLarge;
      } else if (sizingInformation.deviceScreenType
          case DeviceScreenType.tablet) {
        textStyle = Theme.of(context).textTheme.displayLarge;
      } else {
        textStyle = Theme.of(context).textTheme.displayLarge;
      }
  }

  return textStyle;
}
