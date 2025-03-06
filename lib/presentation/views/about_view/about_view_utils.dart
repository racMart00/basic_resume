// import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

TextStyle? getSectionTextStyle(
  String sectionName,
  SizingInformation sizingInformation,
  BuildContext context,
) {
  TextStyle? textStyle;

  // log(sectionName);

  switch (sectionName) {
    case 'title':
      if (sizingInformation.deviceScreenType case DeviceScreenType.desktop) {
        textStyle = Theme.of(context).textTheme.titleSmall;
      } else if (sizingInformation.deviceScreenType
          case DeviceScreenType.tablet) {
        textStyle = Theme.of(context).textTheme.titleMedium;
      } else if (sizingInformation.deviceScreenType
          case DeviceScreenType.mobile) {}
    case 'subtitle':
      if (sizingInformation.deviceScreenType case DeviceScreenType.desktop) {
        textStyle = Theme.of(context).textTheme.bodyLarge;
      } else if (sizingInformation.deviceScreenType
          case DeviceScreenType.tablet) {
        textStyle = Theme.of(context).textTheme.bodyLarge;
      } else if (sizingInformation.deviceScreenType
          case DeviceScreenType.mobile) {}
    case 'where':
      if (sizingInformation.deviceScreenType case DeviceScreenType.desktop) {
        textStyle = Theme.of(context).textTheme.bodySmall;
      } else if (sizingInformation.deviceScreenType
          case DeviceScreenType.tablet) {
        textStyle = Theme.of(context).textTheme.bodySmall;
      } else if (sizingInformation.deviceScreenType
          case DeviceScreenType.mobile) {}
    case 'date':
      if (sizingInformation.deviceScreenType case DeviceScreenType.desktop) {
        textStyle = Theme.of(context).textTheme.bodySmall;
      } else if (sizingInformation.deviceScreenType
          case DeviceScreenType.tablet) {
        textStyle = Theme.of(context).textTheme.bodySmall;
      } else if (sizingInformation.deviceScreenType
          case DeviceScreenType.mobile) {}
    case 'description':
      if (sizingInformation.deviceScreenType case DeviceScreenType.desktop) {
        textStyle = Theme.of(context).textTheme.bodySmall;
      } else if (sizingInformation.deviceScreenType
          case DeviceScreenType.tablet) {
        textStyle = Theme.of(context).textTheme.bodyMedium;
      } else if (sizingInformation.deviceScreenType
          case DeviceScreenType.mobile) {}
    case 'tags':
      if (sizingInformation.deviceScreenType case DeviceScreenType.desktop) {
        textStyle = Theme.of(context).textTheme.bodySmall;
      } else if (sizingInformation.deviceScreenType
          case DeviceScreenType.tablet) {
        textStyle = Theme.of(context).textTheme.bodySmall;
      } else if (sizingInformation.deviceScreenType
          case DeviceScreenType.mobile) {}
    default:
      if (sizingInformation.deviceScreenType case DeviceScreenType.desktop) {
        textStyle = Theme.of(context).textTheme.bodySmall;
      } else if (sizingInformation.deviceScreenType
          case DeviceScreenType.tablet) {
        textStyle = Theme.of(context).textTheme.bodySmall;
      } else if (sizingInformation.deviceScreenType
          case DeviceScreenType.mobile) {}
  }

  return textStyle;
}
