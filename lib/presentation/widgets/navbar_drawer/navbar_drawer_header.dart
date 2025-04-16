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
    final font = Theme.of(context).textTheme;

    return Stack(
      children: [
        Container(
          height: isAndroid ? topSafeAreaPadding + 150 : 150,
          color: Colors.green.shade600,
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: isAndroid ? topSafeAreaPadding : 1),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Hi! I'm_racMart",
                style: TextStyle(
                  fontSize: font.displayLarge!.fontSize,
                  fontWeight: font.displayLarge!.fontWeight,
                  fontFamily: font.displayLarge!.fontFamily,
                  color: Colors.white,
                ),
              ),
              Text(
                'Front-End Developer',
                style: TextStyle(
                  fontSize: font.titleMedium!.fontSize,
                  fontWeight: font.titleMedium!.fontWeight,
                  fontFamily: font.titleMedium!.fontFamily,
                  color: Colors.white,
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
              color: Colors.white,
              context.watch<ThemeCubit>().state.themeMode == ThemeMode.dark
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
