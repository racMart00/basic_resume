import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:basic_resume/presentation/cubits/screen_size_cubit/screen_size_cubit.dart';

class CenteredView extends StatelessWidget {
  final Widget child;

  const CenteredView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ScreenSizeCubit(context: context),
      child: BlocBuilder<ScreenSizeCubit, Size>(
        builder: (context, size) {
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.1,
              vertical: size.height * 0.05,
            ),
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 1200),
              child: child,
            ),
          );
        },
      ),
    );
  }
}
