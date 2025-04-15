import 'package:basic_resume/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectsViewMobile extends StatefulWidget {
  const ProjectsViewMobile({super.key});

  @override
  State<ProjectsViewMobile> createState() => _ProjectsViewMobileState();
}

class _ProjectsViewMobileState extends State<ProjectsViewMobile> {
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
            ? ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.only(
                    top: size.height * 0.01, bottom: size.height * 0.02,),
                physics: const BouncingScrollPhysics(),
                itemCount: state.projects.length,
                itemBuilder: (context, index) {
                  final project = state.projects[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: size.height * 0.005,),
                    child: ProjectCard(
                      img: project.img,
                      title: project.title,
                      description: project.description,
                      tags: project.tags,
                    ),
                  );
                },
              )
            : state is ProjectError
                ? Text(state.message)
                : PhantomProgressIndicator(
                    size: size,
                    boxWidth: 0.45,
                  );
      },
    );
  }
}
