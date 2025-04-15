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
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.025,
              vertical: size.height * 0.02,
            ),
            child: Column(
              children: [
                const NavBarItem(
                  title: 'Home',
                  icon: Icons.home_filled,
                  path: '/0',
                ),
                SizedBox(height: size.height * 0.02,),
                const NavBarItem(
                  title: 'About',
                  icon: Icons.account_circle_rounded,
                  path: '/1',
                ),
                SizedBox(height: size.height * 0.02,),
                const NavBarItem(
                  title: 'My Work',
                  icon: Icons.shopping_bag,
                  path: '/2',
                ),
                SizedBox(height: size.height * 0.02,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
