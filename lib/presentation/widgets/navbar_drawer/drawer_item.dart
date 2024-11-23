import 'package:flutter/material.dart';

import 'package:basic_resume/presentation/presentation.dart';

//TODO: Puedo combinar este drawer item con el navbar item
class DrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;

  const DrawerItem({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30, top: 60),
      child: Row(
        children: [
          Icon(icon),
          SizedBox(width: 30),
          NavBarItem(title: title),
        ],
      ),
    );
  }
}
