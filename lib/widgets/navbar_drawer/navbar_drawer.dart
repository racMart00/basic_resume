import 'package:basic_resume/widgets/navbar_drawer/drawer_item.dart';
import 'package:basic_resume/widgets/navbar_drawer/navbar_drawer_header.dart';
import 'package:flutter/material.dart';

class NavBarDrawer extends StatelessWidget {
  const NavBarDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: Colors.black87, blurRadius: 8)],
      ),
      child: Column(
        children: [
          NavBarDrawerHeader(),
          DrawerItem(
            title: 'Episodes',
            icon: Icons.videocam,
          ),
          DrawerItem(
            title: 'About',
            icon: Icons.help,
          ),
        ],
      ),
    );
  }
}
