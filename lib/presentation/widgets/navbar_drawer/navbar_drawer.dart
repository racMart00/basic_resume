import 'package:basic_resume/presentation/presentation.dart';
import 'package:flutter/material.dart';

class NavBarDrawer extends StatelessWidget {
  const NavBarDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: Theme.of(context).colorScheme.surface)],
      ),
      child: const Column(
        children: [
          NavBarDrawerHeader(),
          DrawerItem(title: 'Home', icon: Icons.home_filled, path: '/0',),
          DrawerItem(title: 'About', icon: Icons.account_circle_rounded, path: '/1'),
        ],
      ),
    );
  }
}
