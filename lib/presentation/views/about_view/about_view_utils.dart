import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

TextStyle? getSectionTextStyle(
  String sectionName,
  SizingInformation sizingInformation,
  BuildContext context,
) {
  TextStyle? textStyle;

  log(sectionName);

  switch (sectionName) {
    case 'title':
      switch (sizingInformation.deviceScreenType) {
        case DeviceScreenType.desktop:
          textStyle = Theme.of(context).textTheme.titleSmall;
        case DeviceScreenType.tablet:
          textStyle = Theme.of(context).textTheme.titleMedium;
        case DeviceScreenType.mobile:
        default:
          textStyle = Theme.of(context).textTheme.titleLarge;
      }
    case 'subtitle':
      switch (sizingInformation.deviceScreenType) {
        case DeviceScreenType.desktop:
          textStyle = Theme.of(context).textTheme.bodyLarge;
        case DeviceScreenType.tablet:
          textStyle = Theme.of(context).textTheme.bodyLarge;
        case DeviceScreenType.mobile:
        default:
          textStyle = Theme.of(context).textTheme.bodyLarge;
      }
    case 'where':
      switch (sizingInformation.deviceScreenType) {
        case DeviceScreenType.desktop:
          textStyle = Theme.of(context).textTheme.bodySmall;
        case DeviceScreenType.tablet:
          textStyle = Theme.of(context).textTheme.bodySmall;
        case DeviceScreenType.mobile:
        default:
          textStyle = Theme.of(context).textTheme.bodySmall;
      }
    case 'date':
      switch (sizingInformation.deviceScreenType) {
        case DeviceScreenType.desktop:
          textStyle = Theme.of(context).textTheme.bodySmall;
        case DeviceScreenType.tablet:
          textStyle = Theme.of(context).textTheme.bodySmall;
        case DeviceScreenType.mobile:
        default:
          textStyle = Theme.of(context).textTheme.bodySmall;
      }
    case 'description':
      switch (sizingInformation.deviceScreenType) {
        case DeviceScreenType.desktop:
          textStyle = Theme.of(context).textTheme.bodySmall;
        case DeviceScreenType.tablet:
          textStyle = Theme.of(context).textTheme.bodyMedium;
        case DeviceScreenType.mobile:
        default:
          textStyle = Theme.of(context).textTheme.bodyLarge;
      }
    case 'tags':
      switch (sizingInformation.deviceScreenType) {
        case DeviceScreenType.desktop:
          textStyle = Theme.of(context).textTheme.bodySmall;
        case DeviceScreenType.tablet:
          textStyle = Theme.of(context).textTheme.bodySmall;
        case DeviceScreenType.mobile:
        default:
          textStyle = Theme.of(context).textTheme.bodySmall;
      }
    default:
      switch (sizingInformation.deviceScreenType) {
        case DeviceScreenType.desktop:
          textStyle = Theme.of(context).textTheme.bodySmall;
        case DeviceScreenType.tablet:
          textStyle = Theme.of(context).textTheme.bodySmall;
        case DeviceScreenType.mobile:
        default:
          textStyle = Theme.of(context).textTheme.bodySmall;
      }
  }

  return textStyle;
}
