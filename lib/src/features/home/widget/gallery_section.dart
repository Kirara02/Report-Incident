// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:report_incident/src/config/constant.dart';
import 'package:report_incident/src/config/screen.dart';
import 'package:report_incident/src/config/theme/colors.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../l10n/locale_keys.g.dart';

class GalerySection extends StatefulWidget {
  const GalerySection({Key? key}) : super(key: key);

  @override
  State<GalerySection> createState() => _GalerySectionState();
}

class _GalerySectionState extends State<GalerySection> {
  CarouselController controller = CarouselController();
  int currentCarousel = 0;

  List<Map<String, dynamic>> data = [
    {
      'img_url': Assets.images.banner.path,
    },
    {
      'img_url': Assets.images.banner.path,
    },
    {
      'img_url': Assets.images.banner.path,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.home_gallery.tr(),
          style: const TextStyle(
            fontSize: AppConstants.kFontSizeM,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 2.0,
        ),
        CarouselSlider(
          carouselController: controller,
          options: CarouselOptions(
            height: 120,
            aspectRatio: 16 / 9,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: false,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              setState(() {
                currentCarousel = index;
              });
            },
          ),
          items: data.map((data) {
            return Container(
              width: AppScreens.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage(data['img_url']),
                  fit: BoxFit.fill,
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(
          height: 2.0,
        ),
        Row(
          children: data.asMap().entries.map((entry) {
            final index = entry.key;
            return Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  width: currentCarousel == index ? 20 : 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: currentCarousel == index
                        ? AppColors.biru1
                        : Colors.grey,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
