import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:basic_resume/config/router/app_router.dart';
import 'package:basic_resume/presentation/providers/theme_bloc/theme_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            title: 'racMart',
            theme: getThemeData(state.themeMode),
            routerConfig: appRouter,
          );
        },
      ),
    );
  }
}
