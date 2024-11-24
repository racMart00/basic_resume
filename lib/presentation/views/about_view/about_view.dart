import 'package:flutter/material.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaqsize = MediaQuery.of(context).size;
    return Center(
      child: Column(
        children: [Text('${mediaqsize.width}, ${mediaqsize.height}')],
      ),
    );
  }
}
