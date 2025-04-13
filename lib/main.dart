import 'dart:io';
import 'package:basic_resume/config/config.dart';
import 'package:basic_resume/presentation/presentation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb && Platform.isAndroid) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.top],
    );
    
  }
  if (kDebugMode) {
    WakelockPlus.enable();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
            },
          );
        },
      ),
    );
  }
}
