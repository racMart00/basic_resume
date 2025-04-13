import 'dart:io';
import 'package:basic_resume/presentation/presentation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavBarDrawerHeader extends StatelessWidget {
  const NavBarDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final topSafeAreaPadding = MediaQuery.of(context).padding.top;
    final isAndroid = !kIsWeb && Platform.isAndroid;

    //TODO: Improve responsive text here
    return Stack(
      children: [
        Container(
          height: isAndroid ? topSafeAreaPadding + 150 : 150,
          color: Colors.green.shade600,
          alignment: Alignment.center,
          padding:
              EdgeInsets.only(top: isAndroid ? topSafeAreaPadding : 1),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'SKILL UP NOW',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Theme.of(context).colorScheme.inverseSurface,
                ),
              ),
              Text(
                'TAP HERE',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.inverseSurface,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: isAndroid
              ? topSafeAreaPadding + 8
              : 8, // Ajusta la posición vertical
          right: 8, // Ajusta la posición horizontal
          child: IconButton(
            icon: Icon(
              context.read<ThemeCubit>().state.themeMode == ThemeMode.dark
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
            onPressed: () {
              context.read<ThemeCubit>().toggleTheme();
            },
          ),
        ),
      ],
    );
  }
}
