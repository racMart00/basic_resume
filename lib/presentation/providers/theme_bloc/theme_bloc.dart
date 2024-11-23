import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Eventos del BLoC
abstract class ThemeEvent {}

class ToggleThemeEvent extends ThemeEvent {}

// Estado del BLoC
class ThemeState {
  final ThemeMode themeMode;

  ThemeState(this.themeMode);
}

// BLoC para gestionar el tema
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(ThemeMode.dark)) {
    // Registra el manejador para ToggleThemeEvent
    on<ToggleThemeEvent>((event, emit) {
      final newMode = state.themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
      emit(ThemeState(newMode)); // Emitimos el nuevo estado
    });
  }
}

// Función para obtener el tema según el estado
ThemeData getThemeData(ThemeMode mode) {
  return mode == ThemeMode.dark ? ThemeData.dark() : ThemeData.light();
}