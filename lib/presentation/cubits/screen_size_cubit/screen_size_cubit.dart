import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenSizeCubit extends Cubit<Size> {
  final BuildContext context;
  Timer? _timer;

  ScreenSizeCubit({required this.context}) : super(MediaQuery.of(context).size) {
    _startListening();
  }

  void _startListening() {
    _timer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      final newSize = MediaQuery.of(context).size;
      if (newSize != state) {
        emit(newSize); // Emit new size if it has changed
      }
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel(); // Cancel the timer when the cubit is closed
    return super.close();
  }
}