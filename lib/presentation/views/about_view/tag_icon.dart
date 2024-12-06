import 'package:flutter/material.dart';

import 'package:basic_resume/presentation/presentation.dart';

class TagIcon extends StatelessWidget {
  final String tagTitle;
  final Color tagColor;
  final String svgDir;
  final String svgTitle;

  const TagIcon({
    super.key,
    required this.tagTitle,
    required this.tagColor,
    required this.svgDir,
    required this.svgTitle,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.06,
      height: 30,
      decoration: BoxDecoration(
        color: tagColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(tagTitle, style: TextStyle(color: Colors.white)),

          DevIcon(svgDir: svgDir, svgTitle: svgTitle),
        ],
      ),
    );
  }
}
