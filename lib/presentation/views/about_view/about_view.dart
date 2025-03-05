import 'package:basic_resume/infrastructure/infrastructure.dart';
import 'package:basic_resume/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SectionCubit(SectionDatasource()),
      child: ScreenTypeLayout.builder(
        mobile: (BuildContext context) => const AboutViewMobile(),
        tablet: (BuildContext context) => const AboutViewTablet(),
        desktop: (BuildContext context) => const AboutViewDesktop(),
      ),
    );
  }
}
