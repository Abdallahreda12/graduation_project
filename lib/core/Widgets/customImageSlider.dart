import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/Widgets/dotsIndicator.dart';

class CustomImagesSlider extends StatefulWidget {
  const CustomImagesSlider(
      {super.key, required this.imagePaths, required this.colorsOfDots});
  final List<String> imagePaths;
  final Color colorsOfDots;

  @override
  State<CustomImagesSlider> createState() => _CustomImagesSliderState();
}

class _CustomImagesSliderState extends State<CustomImagesSlider> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 218,
            viewportFraction: 1,
            pageSnapping: true,
            enableInfiniteScroll: true,
            onPageChanged: (index, reason) {
              setState(() {
                activeIndex = index;
              });
            },
          ),
          items: widget.imagePaths.map((imagePath) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                imagePath,
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width,
              ),
            );
          }).toList(),
        ),
        Positioned(
          bottom: 10,
          child: DotsIndicator(
            numOfDots: widget.imagePaths.length,
            currentCardIndex: activeIndex,
            colorOfDots: widget.colorsOfDots,
          ),
        ),
      ],
    );
  }
}
