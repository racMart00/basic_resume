import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:basic_resume/presentation/presentation.dart';
import 'package:basic_resume/config/config.dart';
import 'package:responsive_builder/responsive_builder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return ResponsiveBuilder(
            builder: (context, sizingInformation) {
              return MaterialApp.router(
                title: 'racMart',
                theme: AppTheme.lightTheme(size, sizingInformation),
                darkTheme: AppTheme.darkTheme(size, sizingInformation),
                themeMode: state.themeMode,
                routerConfig: appRouter,
              );
            }
          );
        },
      ),
    );
  }
}