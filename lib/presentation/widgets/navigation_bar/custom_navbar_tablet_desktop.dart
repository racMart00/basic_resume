import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:basic_resume/presentation/presentation.dart';
import 'package:basic_resume/presentation/providers/theme_bloc/theme_bloc.dart';

class CustomNavBarTabletDesktop extends StatelessWidget {
  const CustomNavBarTabletDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NavBarLogo(),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(
                  context.read<ThemeBloc>().state.themeMode == ThemeMode.dark
                      ? Icons.light_mode
                      : Icons.dark_mode,
                ),
                onPressed: () {
                  context.read<ThemeBloc>().add(ToggleThemeEvent()); // Alterna el tema
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
