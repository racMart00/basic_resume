import 'package:basic_resume/presentation/presentation.dart';
import 'package:flutter/material.dart';

class NavBarDrawer extends StatelessWidget {
  const NavBarDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: 250,
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: Theme.of(context).colorScheme.surface)],
      ),
      child: Column(
        children: [
          const NavBarDrawerHeader(),
          SizedBox(height: size.height * 0.02,),
          const DrawerItem(title: 'Home', icon: Icons.home_filled, path: '/0',),
          const DrawerItem(title: 'About', icon: Icons.account_circle_rounded, path: '/1'),
        ],
      ),
    );
  }
}
