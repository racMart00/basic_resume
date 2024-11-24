import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:basic_resume/presentation/presentation.dart';

class CustomNavBarTabletDesktop extends StatelessWidget {
  const CustomNavBarTabletDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          NavBarLogo(),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(
                  context.read<ThemeCubit>().state.themeMode == ThemeMode.dark
                      ? Icons.light_mode
                      : Icons.dark_mode,
                ),
                onPressed: () {
                  context.read<ThemeCubit>().toggleTheme(); // Alterna el tema
                },
              ),
              SizedBox(width: 20),
              NavBarItem(title: "Home", icon: Icons.home_filled, path: '/',),
              SizedBox(width: 20),
              NavBarItem(title: "About", icon: Icons.account_circle, path: '/1',),
            ],
          ),
        ],
      ),
    );
  }
}
