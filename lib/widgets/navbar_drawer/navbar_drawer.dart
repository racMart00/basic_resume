import 'package:basic_resume/widgets/navbar_drawer/drawer_item.dart';
import 'package:basic_resume/widgets/navbar_drawer/navbar_drawer_header.dart';
import 'package:flutter/material.dart';

//TODO: Puedo combinar este drawer item con el navbar item
class NavBarDrawer extends StatelessWidget {
  const NavBarDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 16)],
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
