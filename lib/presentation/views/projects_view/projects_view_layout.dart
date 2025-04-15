import 'package:basic_resume/infrastructure/infrastructure.dart';
import 'package:basic_resume/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ProjectsViewLayout extends StatelessWidget {
  const ProjectsViewLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProjectCubit(ProjectDatasource()),
      child: ScreenTypeLayout.builder(
        mobile: (BuildContext context) => const ProjectsViewMobile(),
        tablet: (BuildContext context) => const ProjectsViewTablet(),
        desktop: (BuildContext context) => const ProjectsViewDesktop(),
      ),
    );
  }
}
