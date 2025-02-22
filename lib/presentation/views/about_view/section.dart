import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:basic_resume/domain/domain.dart';
import 'package:basic_resume/presentation/presentation.dart';

class Section extends StatefulWidget {
  final String title;
  final String? subtitle;
  final String? where;
  final String? date;
  final double? carrouselHeight;
  final dynamic description;
  final Map<String, TagEntity>? tags;

  const Section({
    super.key,
    required this.title,
    this.subtitle,
    this.where,
    this.date,
    this.carrouselHeight,
    required this.description,
    this.tags,
  });

  @override
  State<Section> createState() => _SectionState();
}

class _SectionState extends State<Section> {
  int currentIndex = 0;
  final CarouselSliderController carouselController =
      CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.title, style: getSectionTextStyle(widget.title, sizingInformation, context)),
            Divider(),
            if (widget.subtitle != null) ...[
              Text(
                widget.subtitle!,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: size.height * 0.005),
            ],
            if (widget.where != null) ...[
              Text(widget.where!, style: Theme.of(context).textTheme.bodySmall),
              SizedBox(height: size.height * 0.005),
            ],
            if (widget.date != null) ...[
              Text(widget.date!, style: Theme.of(context).textTheme.bodySmall),
              SizedBox(height: size.height * 0.005),
            ],
            SizedBox(height: size.height * 0.005),
            if (widget.description is String) ...[
              Text(
                widget.description as String,
                style: Theme.of(context).textTheme.bodyMedium,
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
                        autoPlayInterval: Duration(seconds: 5),
                        autoPlayCurve: Curves.easeIn,
                        autoPlayAnimationDuration: Duration(milliseconds: 500),
                        enableInfiniteScroll: true,
                        scrollDirection: Axis.horizontal,
                        initialPage: 0,
                        viewportFraction: 1,
                        disableCenter: true,
                        height: widget.carrouselHeight,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                      ),
                      items:
                          (widget.description as List<String>).map((desc) {
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
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
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
                      child: Container(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        height: size.height * 0.03,
                        child: DotIndicator(
                          currentIndex: currentIndex,
                          dotCount: (widget.description as List<String>).length,
                        ),
                      ),
                    ),
                  ],
                ),
              ] else
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                      (widget.description as List<String>).map((desc) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              " - $desc",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            SizedBox(height: size.height * 0.0025),
                          ],
                        );
                      }).toList(),
                ),
            ],
            SizedBox(height: size.height * 0.005),
            if (widget.tags != null) ...[
              Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children:
                    widget.tags!.entries.map((entry) {
                      return TagIcon(
                        tagTitle: entry.key,
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
