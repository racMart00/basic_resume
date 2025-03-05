import 'package:basic_resume/presentation/presentation.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AboutViewMobile extends StatefulWidget {
  const AboutViewMobile({super.key});

  @override
  State<AboutViewMobile> createState() => _AboutViewMobileState();
}

class _AboutViewMobileState extends State<AboutViewMobile> {
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
              SizedBox(
                width: size.width,
                height: size.height * 0.4,
                child: Stack(
                  children: [
                    CarouselSlider(
                      carouselController: carouselController,
                      options: CarouselOptions(
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 10),
                        autoPlayCurve: Curves.easeIn,
                        autoPlayAnimationDuration: const Duration(milliseconds: 500),
                        viewportFraction: 1,
                        disableCenter: true,
                        // height: size.width * 0.22,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                      ),
                      items: [
                        if (state is SectionLoaded) Section(
                              title: state.sections[3].title,
                              description: state.sections[3].description,
                            ) else state is SectionError
                            ? Text(state.message)
                            : PhantomProgressIndicator(
                              size: size,
                              boxWidth: 0.45,
                            ),
                        if (state is SectionLoaded) Section(
                              title: state.sections[4].title,
                              description: state.sections[4].description,
                            ) else state is SectionError
                            ? Text(state.message)
                            : PhantomProgressIndicator(
                              size: size,
                              boxWidth: 0.45,
                            ),
                        if (state is SectionLoaded) Section(
                              title: state.sections[5].title,
                              description: state.sections[5].description,
                              tags: state.sections[5].tags,
                            ) else state is SectionError
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
                        height: size.height * 0.04,
                        child: DotIndicator(
                          currentIndex: currentIndex,
                          dotCount: 3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.01),
              Container(
                color: Colors.green.shade400,
                width: size.width,
                height: size.height * 0.4,
                child: const Center(child: Text('Section 2')),
              ),
              SizedBox(height: size.height * 0.01),
              Container(
                color: Colors.green.shade400,
                width: size.width,
                height: size.height * 0.4,
                child: const Center(child: Text('Section 3')),
              ),
            ],
          ),
        );
      },
    );
  }
}
