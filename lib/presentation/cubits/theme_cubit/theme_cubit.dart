import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Estado del Cubit
class ThemeState {
  final ThemeMode themeMode;

  ThemeState(this.themeMode);
}

// Cubit para gestionar el tema
class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(ThemeMode.dark));

  // Método para alternar el tema
  void toggleTheme() {
    final newMode = state.themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    emit(ThemeState(newMode)); // Emitimos el nuevo estado
  }
}