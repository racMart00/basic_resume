import 'package:basic_resume/presentation/presentation.dart';
import 'package:flutter/material.dart';

//TODO: Puedo combinar este drawer item con el navbar item
class DrawerItem extends StatelessWidget {

  const DrawerItem({
    super.key,
    required this.title,
    required this.icon,
    required this.path,
  });
  final String title;
  final IconData icon;
  final String path;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 30),
      child: Row(
        children: [
          NavBarItem(title: title, icon: icon, path: path),
        ],
      ),
    );
  }
}
