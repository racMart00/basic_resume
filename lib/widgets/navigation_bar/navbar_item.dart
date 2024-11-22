import 'package:flutter/material.dart';

class NavBarItem extends StatelessWidget {
  final String title;

  const NavBarItem({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Text(title, style: TextStyle(fontSize: 18)),
    );
  }
}
