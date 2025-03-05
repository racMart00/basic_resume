import 'package:basic_resume/presentation/presentation.dart';
import 'package:flutter/material.dart';

class TagIcon extends StatelessWidget {

  const TagIcon({
    super.key,
    required this.tagTitle,
    required this.tagColor,
    required this.svgDir,
    required this.svgTitle,
  });
  final String tagTitle;
  final Color tagColor;
  final String svgDir;
  final String svgTitle;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.01,
        vertical: size.height * 0.005,
      ),
      decoration: BoxDecoration(
        color: tagColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(tagTitle, style: TextStyle(
            fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
            color: Colors.white,
          ),),
          SizedBox(width: size.width * 0.006,),
          DevIcon(svgDir: svgDir, svgTitle: svgTitle),
        ],
      ),
    );
  }
}
