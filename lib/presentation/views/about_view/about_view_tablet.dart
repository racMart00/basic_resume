import 'package:flutter/material.dart';

class AboutViewTablet extends StatelessWidget {
  const AboutViewTablet({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.green.shade400,
                  width: size.width,
                  child: const Text(
                    'Section 1',
                  ),
                ),
              ),
            ],
          ),
        ),
    
        Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.blue.shade400,
                width: size.width * 0.3,
                child: const Text(
                  'Section 2',
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.purple.shade400,
                width: size.width * 0.3,
                child: const Text(
                  'Section 3',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
