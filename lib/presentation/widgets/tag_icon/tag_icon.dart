import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_builder/responsive_builder.dart';

class TagIcon extends StatelessWidget {
  const TagIcon({
    required this.tagTitle,
    required this.tagColor,
    required this.svgDir,
    required this.svgTitle,
    super.key,
  });
  final Text tagTitle;
  final Color tagColor;
  final String svgDir;
  final String svgTitle;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        double horizontalPadding;
        double verticalPadding;
        double spacingWidth;
        double iconSize;

        if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
          horizontalPadding = 10.0;
          verticalPadding = 2.0;
          spacingWidth = 6.0;
          iconSize = 14.0;
        } else if (sizingInformation.deviceScreenType ==
            DeviceScreenType.tablet) {
          horizontalPadding = 8.0;
          verticalPadding = 2.0;
          spacingWidth = 5.0;
          iconSize = 14.0;
        } else {
          horizontalPadding = 8.0;
          verticalPadding = 4.0;
          spacingWidth = 4.0;
          iconSize = 16.0;
        }

        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          decoration: BoxDecoration(
            color: tagColor,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              tagTitle,
              SizedBox(
                width: spacingWidth,
              ),
              DevIcon(
                assetPath: svgDir,
                svgTitle: svgTitle,
                size: iconSize,
              ),
            ],
          ),
        );
      },
    );
  }
}

class DevIcon extends StatelessWidget {
  const DevIcon({
    required this.assetPath,
    required this.svgTitle,
    this.size,
    super.key,
  });
  final String assetPath;
  final String svgTitle;
  final double? size;

  @override
  Widget build(BuildContext context) {
    final iconSize = size ?? 18.0;
    const colorFilter = ColorFilter.mode(Colors.white, BlendMode.srcIn);

    try {
      return SvgPicture.asset(
        assetPath,
        semanticsLabel: svgTitle,
        width: iconSize,
        height: iconSize,
        colorFilter: colorFilter,
        placeholderBuilder: (BuildContext context) => SizedBox(
          width: iconSize,
          height: iconSize,
          child: Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      );
    } on Exception catch (e) {
      log(
        "Error loading SVG '$assetPath'",
        error: e,
        name: 'DevIconWidget',
      );
      return SizedBox(
        width: iconSize,
        height: iconSize,
        child: Icon(
          Icons.broken_image_outlined,
          size: iconSize,
          color: Colors.red,
        ),
      );
    }
  }
}
