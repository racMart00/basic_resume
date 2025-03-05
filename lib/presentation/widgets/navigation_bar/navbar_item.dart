import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavBarItem extends StatelessWidget {

  const NavBarItem({
    required this.title, required this.path, required this.icon, super.key,
  });
  final String title;
  final IconData icon;
  final String path;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (Scaffold.of(context).isDrawerOpen) {
          Scaffold.of(context).closeDrawer();
        }
        context.go(path);
      },
      child: Row(
        children: [
          Icon(
            icon,
            size: 24,
            color: Theme.of(context).colorScheme.inverseSurface,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 3, left: 4),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18,
                color: Theme.of(context).colorScheme.inverseSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
