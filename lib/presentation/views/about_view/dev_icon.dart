import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DevIcon extends StatelessWidget {
  final String svgDir;
  final String svgTitle;

  const DevIcon({super.key, required this.svgDir, required this.svgTitle});

  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;

    return Container(
      height: 18,
      width: 18,
      // padding: EdgeInsets.symmetric(
      //   horizontal: size.width * 0.005,
      //   vertical: size.height * 0.005,
      // ),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(14),
      ),
      child: SvgPicture.asset(
        svgDir,
        semanticsLabel: svgTitle,
        fit: BoxFit.contain,
        colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
      ),
    );
  }
}