import 'package:basic_resume/presentation/presentation.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AboutViewTablet extends StatefulWidget {
  const AboutViewTablet({super.key});

  @override
  State<AboutViewTablet> createState() => _AboutViewTabletState();
}

class _AboutViewTabletState extends State<AboutViewTablet> {
  int currentIndex = 0;
  final CarouselSliderController carouselController =
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
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Container(
                        width: size.width * 0.56,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            'assets/images/banner.png',
                            fit: BoxFit.cover,
                            alignment: Alignment.topLeft,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.56,
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
                  SizedBox(width: size.width * 0.01),
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(
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
                        SizedBox(height: size.height * 0.02),
                        SizedBox(
                          child: state is SectionLoaded
                              ? Section(
                                  title: state.sections[2].title,
                                  subtitle: state.sections[2].subtitle,
                                  where: state.sections[2].where,
                                  date: state.sections[2].date,
                                  carrouselHeight: size.width * 0.08,
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
                        SizedBox(height: size.height * 0.02),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.width * 0.24,
                child: Stack(
                  children: [
                    CarouselSlider(
                      carouselController: carouselController,
                      options: CarouselOptions(
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 30),
                        autoPlayCurve: Curves.easeIn,
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 500),
                        viewportFraction: 1,
                        disableCenter: true,
                        height: size.width * 0.24,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                      ),
                      items: [
                        if (state is SectionLoaded)
                          Section(
                            title: state.sections[3].title,
                            description: state.sections[3].description,
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
                            description: state.sections[4].description,
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
                            description: state.sections[5].description,
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
                        color: Theme.of(context).scaffoldBackgroundColor,
                        height: size.height * 0.03,
                        child: DotIndicator(
                          currentIndex: currentIndex,
                          dotCount: 3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
