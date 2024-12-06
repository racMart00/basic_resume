import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:basic_resume/presentation/presentation.dart';

class AboutViewDesktop extends StatefulWidget {
  const AboutViewDesktop({super.key});

  @override
  State<AboutViewDesktop> createState() => _AboutViewDesktopState();
}

class _AboutViewDesktopState extends State<AboutViewDesktop> {
  @override
  void initState() {
    super.initState();
    context.read<SectionCubit>().fetchSections();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return BlocBuilder<SectionCubit, SectionState>(
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      width: size.width,
                      padding: EdgeInsets.only(right: size.width * 0.025),
                      child:
                          state is SectionLoaded
                              ? Section(
                                title: state.sections[0].title,
                                description: state.sections[0].description,
                              )
                              : state is SectionError
                              ? Text((state).message)
                              : PhantomProgressIndicator(
                                size: size,
                                boxWidth: 0.45,
                              ),
                    ),
                  ),
                ],
              ),
            ),

            Column(
              children: [
                Container(
                  color: Colors.transparent,
                  width: size.width * 0.25,
                  margin: EdgeInsets.only(bottom: size.height * 0.025),
                  child:
                      state is SectionLoaded
                          ? Section(
                            title: state.sections[1].title,
                            subtitle: state.sections[1].subtitle,
                            where: state.sections[1].where,
                            date: state.sections[1].date,
                            description: state.sections[1].description,
                          )
                          : state is SectionError
                          ? Text((state).message)
                          : PhantomProgressIndicator(
                            size: size,
                            boxWidth: 0.45,
                          ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.transparent,
                    width: size.width * 0.25,
                    child:
                        state is SectionLoaded
                            ? Section(
                              title: state.sections[2].title,
                              subtitle: state.sections[2].subtitle,
                              where: state.sections[2].where,
                              date: state.sections[2].date,
                              description: state.sections[2].description,
                            )
                            : state is SectionError
                            ? Text((state).message)
                            : PhantomProgressIndicator(
                              size: size,
                              boxWidth: 0.45,
                            ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class PhantomProgressIndicator extends StatelessWidget {
  final Size size;
  final double boxWidth;

  const PhantomProgressIndicator({
    super.key,
    required this.size,
    required this.boxWidth,
  });

  @override
  Widget build(BuildContext context) {
    final List<double> widths = [0.35, 0.3, 0.4, 0.4, 0.4, 0.4];
    final double heightFactor = 0.02;
    final double spacingFactor = 0.015;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(widths.length, (index) {
        return Column(
          children: [
            SizedBox(
              width: size.width * widths[index] * boxWidth,
              child: LinearProgressIndicator(
                minHeight: size.height * heightFactor,
                color: Colors.black45,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            SizedBox(height: size.height * spacingFactor),
          ],
        );
      }),
    );
  }
}
