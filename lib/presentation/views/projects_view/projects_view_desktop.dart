import 'package:basic_resume/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectsViewDesktop extends StatefulWidget {
  const ProjectsViewDesktop({super.key});

  @override
  State<ProjectsViewDesktop> createState() => _ProjectsViewTabletState();
}

class _ProjectsViewTabletState extends State<ProjectsViewDesktop> {
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
            ? SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.only(bottom: size.height * 0.02),
                  child: Wrap(
                    spacing: size.width * 0.02,
                    runSpacing: size.width * 0.02,
                    alignment: WrapAlignment.spaceBetween,
                    children: state.projects.map((project) {
                      final cardWidth = size.width * 0.265;
                      return SizedBox(
                        width: cardWidth,
                        child: ProjectCard(
                          img: project.img,
                          title: project.title,
                          description: project.description,
                          isDownloadable: project.isDownloadable,
                          websiteLink: project.websiteLink,
                          apkDownloadLink: project.apkDownloadLink,
                          tags: project.tags,
                        ),
                      );
                    }).toList(),
                  ),
                ),
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
