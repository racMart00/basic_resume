import 'package:flutter/material.dart';

class PhantomProgressIndicator extends StatelessWidget {
  const PhantomProgressIndicator({
    required this.size,
    required this.boxWidth,
    super.key,
  });
  final Size size;
  final double boxWidth;

  @override
  Widget build(BuildContext context) {
    final widths = <double>[0.35, 0.3, 0.4, 0.4, 0.4, 0.4];
    const heightFactor = 0.02;
    const spacingFactor = 0.015;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(widths.length, (index) {
        return Column(
          children: [
            SizedBox(
              width: size.width * widths[index] * boxWidth,
              child: LinearProgressIndicator(
                minHeight: size.height * heightFactor,
                color: Colors.black45,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            SizedBox(height: size.height * spacingFactor),
          ],
        );
      }),
    );
  }
}
