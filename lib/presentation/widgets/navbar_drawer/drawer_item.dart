import 'package:flutter/material.dart';

import 'package:basic_resume/presentation/presentation.dart';

//TODO: Puedo combinar este drawer item con el navbar item
class DrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final String path;

  const DrawerItem({
    super.key,
    required this.title,
    required this.icon,
    required this.path,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, top: 30),
      child: Row(
        children: [
          NavBarItem(title: title, icon: icon, path: path),
        ],
      ),
    );
  }
}
