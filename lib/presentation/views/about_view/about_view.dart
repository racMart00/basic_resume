import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:basic_resume/presentation/presentation.dart';
import 'package:basic_resume/infrastructure/infrastructure.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SectionCubit(SectionDatasource()),
      child: ScreenTypeLayout.builder(
        mobile: (BuildContext context) => AboutViewMobile(),
        tablet: (BuildContext context) => AboutViewTablet(),
        desktop: (BuildContext context) => AboutViewDesktop(),
      ),
    );
  }
}