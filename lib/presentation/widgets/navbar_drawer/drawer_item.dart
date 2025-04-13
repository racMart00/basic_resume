import 'package:basic_resume/presentation/presentation.dart';
import 'package:flutter/material.dart';

//TODO: Puedo combinar este drawer item con el navbar item
class DrawerItem extends StatelessWidget {
  const DrawerItem({
    required this.title,
    required this.icon,
    required this.path,
    super.key,
  });
  final String title;
  final IconData icon;
  final String path;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.03, vertical: size.height * 0.01,),
      child: Row(
        children: [
          Expanded(child: NavBarItem(title: title, icon: icon, path: path)),
        ],
      ),
    );
  }
}
