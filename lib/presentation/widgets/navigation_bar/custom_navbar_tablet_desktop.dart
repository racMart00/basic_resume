import 'package:basic_resume/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomNavBarTabletDesktop extends StatelessWidget {
  const CustomNavBarTabletDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.14,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const NavBarLogo(),

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
              const NavBarItem(title: 'Home', icon: Icons.home_filled, path: '/'),
              const NavBarItem(
                title: 'About',
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
