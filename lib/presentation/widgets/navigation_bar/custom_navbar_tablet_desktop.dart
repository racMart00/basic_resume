import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:basic_resume/presentation/presentation.dart';

class CustomNavBarTabletDesktop extends StatelessWidget {
  const CustomNavBarTabletDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.14,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          NavBarLogo(),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              BlocBuilder<ThemeCubit, ThemeState>(
                builder: (context, state) {
                  return IconButton(
                    icon: Icon(
                      state.themeMode == ThemeMode.dark
                          ? Icons.light_mode
                          : Icons.dark_mode,
                    ),
                    onPressed: () {
                      context.read<ThemeCubit>().toggleTheme();
                    },
                  );
                },
              ),
              NavBarItem(title: "Home", icon: Icons.home_filled, path: '/'),
              NavBarItem(
                title: "About",
                icon: Icons.account_circle,
                path: '/1',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
