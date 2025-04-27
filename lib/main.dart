import 'dart:io';
import 'package:basic_resume/config/config.dart';
import 'package:basic_resume/firebase_options.dart';
import 'package:basic_resume/presentation/presentation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await dotenv.load();

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  // if (kDebugMode) {
  //   try {
  //     FirebaseFirestore.instance.settings = const Settings(
  //       host: 'localhost:8080',
  //       sslEnabled: false,
  //       persistenceEnabled: false,
  //     );
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (!kIsWeb && Platform.isAndroid) {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

      // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

      SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: [SystemUiOverlay.top],
      );

      if (kDebugMode) {
        WakelockPlus.enable();
      }
    }

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
