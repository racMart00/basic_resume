import 'package:flutter/material.dart';

import 'package:basic_resume/views/layout_template/layout_template.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'racMart',
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: LayoutTemplate(),
    );
  }
}
