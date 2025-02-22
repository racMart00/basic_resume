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
          break;
        case DeviceScreenType.tablet:
          textStyle = Theme.of(context).textTheme.titleMedium;
          break;
        case DeviceScreenType.mobile:
        default:
          textStyle = Theme.of(context).textTheme.titleLarge;
      }
      break;
    case 'subtitle':
      switch (sizingInformation.deviceScreenType) {
        case DeviceScreenType.desktop:
          textStyle = Theme.of(context).textTheme.bodyLarge;
          break;
        case DeviceScreenType.tablet:
          textStyle = Theme.of(context).textTheme.bodyLarge;
          break;
        case DeviceScreenType.mobile:
        default:
          textStyle = Theme.of(context).textTheme.bodyLarge;
      }
      break;
    case 'where':
      switch (sizingInformation.deviceScreenType) {
        case DeviceScreenType.desktop:
          textStyle = Theme.of(context).textTheme.bodySmall;
          break;
        case DeviceScreenType.tablet:
          textStyle = Theme.of(context).textTheme.bodySmall;
          break;
        case DeviceScreenType.mobile:
        default:
          textStyle = Theme.of(context).textTheme.bodySmall;
      }
    case 'date':
      switch (sizingInformation.deviceScreenType) {
        case DeviceScreenType.desktop:
          textStyle = Theme.of(context).textTheme.bodySmall;
          break;
        case DeviceScreenType.tablet:
          textStyle = Theme.of(context).textTheme.bodySmall;
          break;
        case DeviceScreenType.mobile:
        default:
          textStyle = Theme.of(context).textTheme.bodySmall;
      }
    case 'description':
      switch (sizingInformation.deviceScreenType) {
        case DeviceScreenType.desktop:
          textStyle = Theme.of(context).textTheme.bodySmall;
          break;
        case DeviceScreenType.tablet:
          textStyle = Theme.of(context).textTheme.bodyMedium;
          break;
        case DeviceScreenType.mobile:
        default:
          textStyle = Theme.of(context).textTheme.bodyLarge;
      }
    case 'tags':
      switch (sizingInformation.deviceScreenType) {
        case DeviceScreenType.desktop:
          textStyle = Theme.of(context).textTheme.bodySmall;
          break;
        case DeviceScreenType.tablet:
          textStyle = Theme.of(context).textTheme.bodySmall;
          break;
        case DeviceScreenType.mobile:
        default:
          textStyle = Theme.of(context).textTheme.bodySmall;
      }
    default:
      switch (sizingInformation.deviceScreenType) {
        case DeviceScreenType.desktop:
          textStyle = Theme.of(context).textTheme.bodySmall;
          break;
        case DeviceScreenType.tablet:
          textStyle = Theme.of(context).textTheme.bodySmall;
          break;
        case DeviceScreenType.mobile:
        default:
          textStyle = Theme.of(context).textTheme.bodySmall;
      }
  }

  return textStyle;
}
