import 'package:basic_resume/presentation/presentation.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AboutViewDesktop extends StatefulWidget {
  const AboutViewDesktop({super.key});

  @override
  State<AboutViewDesktop> createState() => _AboutViewDesktopState();
}

class _AboutViewDesktopState extends State<AboutViewDesktop> {
  int _currentIndex = 0;
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  @override
  void initState() {
    super.initState();
    context.read<SectionCubit>().fetchSections();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocBuilder<SectionCubit, SectionState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(
                                'assets/images/banner.png',
                                fit: BoxFit.fill,
                                alignment: Alignment.topLeft,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: size.width * 0.225,
                          padding: EdgeInsets.symmetric(
                            horizontal: size.height * 0.01,
                          ),
                          color: Colors.transparent,
                          child: Stack(
                            children: [
                              CarouselSlider(
                                carouselController: _carouselController,
                                options: CarouselOptions(
                                  autoPlay: true,
                                  autoPlayInterval: const Duration(seconds: 10),
                                  autoPlayCurve: Curves.easeIn,
                                  autoPlayAnimationDuration: const Duration(
                                    milliseconds: 500,
                                  ),
                                  viewportFraction: 1,
                                  disableCenter: true,
                                  height: size.width * 0.22,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      _currentIndex = index;
                                    });
                                  },
                                ),
                                items: [
                                  if (state is SectionLoaded)
                                    Section(
                                      title: state.sections[3].title,
                                      description:
                                          state.sections[3].description,
                                    )
                                  else
                                    state is SectionError
                                        ? Text(state.message)
                                        : PhantomProgressIndicator(
                                            size: size,
                                            boxWidth: 0.45,
                                          ),
                                  if (state is SectionLoaded)
                                    Section(
                                      title: state.sections[4].title,
                                      description:
                                          state.sections[4].description,
                                    )
                                  else
                                    state is SectionError
                                        ? Text(state.message)
                                        : PhantomProgressIndicator(
                                            size: size,
                                            boxWidth: 0.45,
                                          ),
                                  if (state is SectionLoaded)
                                    Section(
                                      title: state.sections[5].title,
                                      description:
                                          state.sections[5].description,
                                      tags: state.sections[5].tags,
                                    )
                                  else
                                    state is SectionError
                                        ? Text(state.message)
                                        : PhantomProgressIndicator(
                                            size: size,
                                            boxWidth: 0.45,
                                          ),
                                ],
                              ),
                              Positioned(
                                right: 0,
                                top: 0,
                                child: Container(
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  height: size.height * 0.04,
                                  child: DotIndicator(
                                    currentIndex: _currentIndex,
                                    dotCount: 3,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      color: Colors.transparent,
                      width: size.width,
                      padding: EdgeInsets.only(
                        right: size.height * 0.01,
                        top: size.height * 0.01,
                      ),
                      child: state is SectionLoaded
                          ? Section(
                              title: state.sections[0].title,
                              description: state.sections[0].description,
                            )
                          : state is SectionError
                              ? Text(state.message)
                              : PhantomProgressIndicator(
                                  size: size,
                                  boxWidth: 0.45,
                                ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    color: Colors.transparent,
                    width: size.width * 0.25,
                    margin: EdgeInsets.only(bottom: size.height * 0.01),
                    child: state is SectionLoaded
                        ? Section(
                            title: state.sections[1].title,
                            subtitle: state.sections[1].subtitle,
                            where: state.sections[1].where,
                            date: state.sections[1].date,
                            carrouselHeight: size.width * 0.04,
                            description: state.sections[1].description,
                            tags: state.sections[1].tags,
                          )
                        : state is SectionError
                            ? Text(state.message)
                            : PhantomProgressIndicator(
                                size: size,
                                boxWidth: 0.45,
                              ),
                  ),
                  Container(
                    color: Colors.transparent,
                    width: size.width * 0.25,
                    child: state is SectionLoaded
                        ? Section(
                            title: state.sections[2].title,
                            subtitle: state.sections[2].subtitle,
                            where: state.sections[2].where,
                            date: state.sections[2].date,
                            carrouselHeight: size.width * 0.06,
                            description: state.sections[2].description,
                            tags: state.sections[2].tags,
                          )
                        : state is SectionError
                            ? Text(state.message)
                            : PhantomProgressIndicator(
                                size: size,
                                boxWidth: 0.45,
                              ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    required this.currentIndex,
    required this.dotCount,
    super.key,
  });
  final int currentIndex;
  final int dotCount;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: List.generate(dotCount, (index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: (currentIndex == index)
              ? (size.width * 0.008)
              : (size.width * 0.006),
          height: (currentIndex == index)
              ? (size.width * 0.008)
              : (size.width * 0.006),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: (currentIndex == index)
                ? Theme.of(context).colorScheme.primary
                : Colors.grey,
          ),
        );
      }),
    );
  }
}

class PhantomProgressIndicator extends StatelessWidget {
  const PhantomProgressIndicator({
    required this.size,
    required this.boxWidth,
    super.key,
  });
  final Size size;
  final double boxWidth;

  @override
  Widget build(BuildContext context) {
    final widths = <double>[0.35, 0.3, 0.4, 0.4, 0.4, 0.4];
    const heightFactor = 0.02;
    const spacingFactor = 0.015;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
