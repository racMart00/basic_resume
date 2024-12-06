import 'package:flutter/material.dart';

class AboutViewMobile extends StatelessWidget {
  const AboutViewMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Colors.green.shade400,
            width: size.width,
            height: size.height * 0.4,
            child: Center(child: Text('Section 1')),
          ),
          SizedBox(height: size.height * 0.01),
          Container(
            color: Colors.green.shade400,
            width: size.width,
            height: size.height * 0.4,
            child: Center(child: Text('Section 2')),
          ),
          SizedBox(height: size.height * 0.01),
          Container(
            color: Colors.green.shade400,
            width: size.width,
            height: size.height * 0.4,
            child: Center(child: Text('Section 3')),
          ),
        ],
      ),
    );
  }
}
