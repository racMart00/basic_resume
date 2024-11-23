import 'package:basic_resume/presentation/cubits/screen_size_cubit/screen_size_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// {@template counter_view}
/// A [StatelessWidget] which reacts to the provided
/// [CounterCubit] state and notifies it in response to user input.
/// {@endtemplate}
class ScreenSizeView extends StatelessWidget {
  /// {@macro counter_view}
  const ScreenSizeView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Center(
        child: BlocBuilder<ScreenSizeCubit, Size>(
          builder: (context, size) {
            return Text(
              'Width: ${size.width}, Height: ${size.height}',
              style: textTheme.displayMedium,
            );
          },
        ),
      ),
    );
  }
}
