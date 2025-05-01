// en lib/emulators_firebase_options.dart
// File generated manually for Firebase Emulator configuration
// ignore_for_file: type=lint
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show kIsWeb;

/// Default [FirebaseOptions] for use with your Firebase Emulator Suite.
///
/// Example:
/// ```dart
/// import 'emulators_firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: EmulatorsFirebaseOptions.currentPlatform,
/// );
/// ```
class EmulatorsFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    return android;
  }

  static FirebaseOptions get web {
    return const FirebaseOptions(
      apiKey: 'unused',
      appId: 'emulator',
      messagingSenderId: 'emulator',
      projectId: 'my-resume-143a5',
      // authDomain: 'localhost:9099',
      storageBucket: 'gs://localhost:9199',
    );
  }

  static FirebaseOptions get android {
    return const FirebaseOptions(
      apiKey: 'unused',
      appId: 'emulator',
      messagingSenderId: 'emulator',
      projectId: 'my-resume-143a5',
      authDomain: 'localhost:9099',
      storageBucket: 'gs://localhost:9199',
    );
  }
  static const firestoreEmulatorSettings = Settings(
    host: 'localhost:8080',
    sslEnabled: false,
    persistenceEnabled: false,
  );
}