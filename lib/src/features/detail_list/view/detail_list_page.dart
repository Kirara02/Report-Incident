// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latlong2/latlong.dart';
import 'package:report_incident/gen/assets.gen.dart';
import 'package:report_incident/l10n/locale_keys.g.dart';
import 'package:report_incident/src/config/screen.dart';

import '../../../config/theme/colors.dart';

class DetailListPage extends StatefulWidget {
  final List<Map<String, dynamic>> data;
  const DetailListPage({Key? key, required this.data}) : super(key: key);

  @override
  State<DetailListPage> createState() => _DetailListPageState();
}

class _DetailListPageState extends State<DetailListPage> {
  CarouselController controller = CarouselController();
  int currentCarousel = 0;

  LatLng marker = const LatLng(-6.5591742, 107.4345681);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.back_text.tr()),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 10,
          right: 20,
          left: 20,
          bottom: 30,
        ),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentCarousel = index;
                      });
                    },
                  ),
                  items: widget.data.map((data) {
                    return Container(
                      width: AppScreens.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: AssetImage(data['img_url'][0]),
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
                  children: widget.data.asMap().entries.map((entry) {
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
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  widget.data[0]['title'],
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                const Text(
                  'Kecamatan, Desa, Alamat Lengkap',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  LocaleKeys.detail_description.tr(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 2.0,
                ),
                Text(widget.data[0]['description']),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  LocaleKeys.detail_maps.tr(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 3.0,
                ),
                SizedBox(
                  height: 200,
                  child: FlutterMap(
                    options: MapOptions(
                      center: marker,
                      zoom: 14,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName: 'com.example.app',
                      ),
                      MarkerLayer(
                        markers: [
                          Marker(
                            point: marker,
                            width: 24,
                            height: 24,
                            builder: (context) => SvgPicture.asset(
                                Assets.icons.locationCrosshairsSvgrepoCom.path),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
