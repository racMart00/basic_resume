import 'package:basic_resume/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectsViewTablet extends StatefulWidget {
  const ProjectsViewTablet({super.key});

  @override
  State<ProjectsViewTablet> createState() => _ProjectsViewTabletState();
}

class _ProjectsViewTabletState extends State<ProjectsViewTablet> {
  @override
  void initState() {
    super.initState();
    context.read<ProjectCubit>().fetchProjects();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocBuilder<ProjectCubit, ProjectState>(
      builder: (context, state) {
        return state is ProjectLoaded
            ? GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.only(
                  top: size.height * 0.02,
                  bottom: size.height * 0.03,
                  left: size.width * 0.05,
                  right: size.width * 0.05,
                ),
                physics: const BouncingScrollPhysics(),
                itemCount: state.projects.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: size.height * 0.00145,
                  crossAxisSpacing: size.width * 0.02,
                  mainAxisSpacing: size.height * 0.015,
                ),
                itemBuilder: (context, index) {
                  final project = state.projects[index];
                  return ProjectCard(
                    img: project.img,
                    title: project.title,
                    description: project.description,
                    tags: project.tags,
                  );
                },
              )
            : state is ProjectError
                ? Center(child: Text(state.message))
                : Center(
                    child: PhantomProgressIndicator(
                      size: size,
                      boxWidth: 0.3,
                    ),
                  );
      },
    );
  }
}
