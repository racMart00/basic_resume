import 'package:basic_resume/domain/domain.dart';
import 'package:basic_resume/presentation/presentation.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Section extends StatefulWidget {
  const Section({
    required this.title,
    required this.description,
    super.key,
    this.subtitle,
    this.where,
    this.date,
    this.carrouselHeight,
    this.tags,
  });
  final String title;
  final String? subtitle;
  final String? where;
  final String? date;
  final double? carrouselHeight;
  final dynamic description;
  final Map<String, TagEntity>? tags;

  @override
  State<Section> createState() => _SectionState();
}

class _SectionState extends State<Section> {
  int currentIndex = 0;
  late final CarouselSliderController carouselController;

  @override
  void initState() {
    super.initState();
    carouselController = CarouselSliderController();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: getFontTextStyle(
                'title',
                sizingInformation,
                context,
              ),
            ),
            const Divider(),
            if (widget.subtitle != null) ...[
              Text(
                widget.subtitle!,
                style: getFontTextStyle(
                  'subtitle',
                  sizingInformation,
                  context,
                ),
              ),
              SizedBox(height: size.height * 0.005),
            ],
            if (widget.where != null) ...[
              Text(
                widget.where!,
                style: getFontTextStyle(
                  'where',
                  sizingInformation,
                  context,
                ),
              ),
              SizedBox(height: size.height * 0.005),
            ],
            if (widget.date != null) ...[
              Text(
                widget.date!,
                style: getFontTextStyle(
                  'date',
                  sizingInformation,
                  context,
                ),
              ),
              SizedBox(height: size.height * 0.005),
            ],
            SizedBox(height: size.height * 0.005),
            if (widget.description is String) ...[
              Text(
                widget.description as String,
                style: getFontTextStyle(
                  'description',
                  sizingInformation,
                  context,
                ),
                textAlign: TextAlign.start,
              ),
            ] else if (widget.description is List<String>) ...[
              if (widget.carrouselHeight != null) ...[
                Stack(
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
                        height: widget.carrouselHeight,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                      ),
                      items: (widget.description as List<String>).map((desc) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: size.width,
                              padding: EdgeInsets.only(
                                right: size.height * 0.06,
                              ),
                              color: Colors.transparent,
                              child: Text(
                                desc,
                                style: getFontTextStyle(
                                  'description',
                                  sizingInformation,
                                  context,
                                ),
                                textAlign: TextAlign.start,
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: ColoredBox(
                        color: Theme.of(context)
                            .scaffoldBackgroundColor
                            .withOpacity(0.7),
                        child: DotIndicator(
                          currentIndex: currentIndex,
                          dotCount: (widget.description as List<String>).length,
                        ),
                      ),
                    ),
                  ],
                ),
              ] else ...[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: (widget.description as List<String>).map((desc) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: size.height * 0.0025),
                      child: Text(
                        ' - $desc',
                        style: getFontTextStyle(
                          'description',
                          sizingInformation,
                          context,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ],
            SizedBox(height: size.height * 0.01),
            if (widget.tags != null) ...[
              Wrap(
                spacing: 8,
                runSpacing: 4,
                children: widget.tags!.entries.map((entry) {
                  return TagIcon(
                    tagTitle: Text(
                      entry.key,
                      style: getFontTextStyle(
                        'tags',
                        sizingInformation,
                        context,
                      ),
                    ),
                    tagColor: entry.value.color,
                    svgDir: entry.value.icon,
                    svgTitle: entry.key,
                  );
                }).toList(),
              ),
            ],
          ],
        );
      },
    );
  }
}
