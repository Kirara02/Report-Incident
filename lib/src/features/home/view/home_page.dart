// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:page_transition/page_transition.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:report_incident/l10n/locale_keys.g.dart';
import 'package:report_incident/src/config/constant.dart';
import 'package:report_incident/src/config/theme/colors.dart';
import 'package:report_incident/src/features/formulir/view/formulir_page.dart';
import 'package:report_incident/src/features/home/widget/gallery_section.dart';
import 'package:report_incident/src/features/home/widget/menu_item.dart';
import 'package:report_incident/src/features/list_titik_rawan/view/list_titik_rawan_page.dart';
import 'package:report_incident/src/widgets/card/report_card.dart';
import 'package:report_incident/src/widgets/dialogs/ux_toast_wrapper.dart';

import '../../../../gen/assets.gen.dart';
import '../../list_report/view/list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final permissionLocation = Permission.location;
  late Position position;

  @override
  void initState() {
    // Future.microtask(() => )
    super.initState();
  }

  Future<void> requestLocationPermission() async {
    if (await permissionLocation.serviceStatus.isDisabled) {
      UXToast.show(
        message: LocaleKeys.home_toast_location_off.tr(),
        // backgroundColor: AppColors.red,
        toastGravity: ToastGravity.BOTTOM,
      );
    } else {
      if (await permissionLocation.isPermanentlyDenied) {
        openAppSettings();
      } else {
        final status = await permissionLocation.request();
        if (status == PermissionStatus.granted) {
          // Get the current location
          position = await Geolocator.getCurrentPosition();
        } else {
          UXToast.show(
            message: LocaleKeys.home_toast_permission_reject.tr(),
            // backgroundColor: AppColors.red,
            toastGravity: ToastGravity.BOTTOM,
          );
        }
      }
    }
  }

  Future showNextDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  LocaleKeys.home_dialog_announcement.tr(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                SvgPicture.asset(Assets.icons.location.path),
                const SizedBox(
                  height: 5.0,
                ),
                Text(LocaleKeys.home_dialog_description.tr()),
                const SizedBox(
                  height: 15.0,
                ),
                SizedBox(
                  width: 110,
                  child: ElevatedButton(
                    onPressed: () {
                      requestLocationPermission().whenComplete(() async {
                        if (await permissionLocation.status.isGranted &&
                            await permissionLocation.serviceStatus.isEnabled) {
                          log('success: ${position.latitude}, ${position.longitude}');
                          if (!mounted) return;
                          Navigator.pop(context);
                          pushDynamicScreen(context,
                              screen: PageTransition(
                                  child: const FormulirPage(),
                                  type: PageTransitionType.bottomToTop));
                        } else {
                          
                          log('failed');
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      side: const BorderSide(color: AppColors.biru1),
                      backgroundColor: AppColors.biru1,
                    ),
                    child: Text(
                      LocaleKeys.active_text.tr(),
                      style: const TextStyle(
                        color: UIColors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(
            top: 50.0,
            bottom: 30.0,
            left: 20.0,
            right: 20.0,
          ),
          child: Column(
            children: [
              const GalerySection(),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: MenuItem(
                      title: LocaleKeys.home_vulnerable_point.tr(),
                      icon: Assets.icons.trafficConeOff.path,
                      color: AppColors.green,
                      onTap: () => pushDynamicScreen(context,
                          screen: PageTransition(
                              child: const ListTitikRawanPage(),
                              type: PageTransitionType.bottomToTop)),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    flex: 1,
                    child: MenuItem(
                      title: LocaleKeys.home_report.tr(),
                      icon: Assets.icons.fileDiff.path,
                      color: AppColors.biru2,
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              child: Container(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Center(
                                      child: Text(
                                        LocaleKeys.home_dialog_title.tr(),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      '1. ${LocaleKeys.home_dialog_no_1.tr()}',
                                    ),
                                    Text(
                                      '2. ${LocaleKeys.home_dialog_no_2.tr()}',
                                    ),
                                    Text(
                                      '3. ${LocaleKeys.home_dialog_no_3.tr()}',
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        SizedBox(
                                          width: 110,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                side: const BorderSide(
                                                    color: UIColors.text)),
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: Text(
                                              LocaleKeys.back_text.tr(),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 110,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                              showNextDialog(context);
                                            },
                                            style: ElevatedButton.styleFrom(
                                              side: const BorderSide(
                                                  color: AppColors.biru1),
                                              backgroundColor: AppColors.biru1,
                                            ),
                                            child: Text(
                                              LocaleKeys.next_text.tr(),
                                              style: const TextStyle(
                                                color: UIColors.white,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    LocaleKeys.home_report_data.tr(),
                    style: const TextStyle(
                      fontSize: AppConstants.kFontSizeL,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextButton(
                    onPressed: () => pushDynamicScreen(context,
                        screen: PageTransition(
                            child: const ListPage(),
                            type: PageTransitionType.bottomToTop,
                            duration: const Duration(milliseconds: 300))),
                    child: Text(
                      LocaleKeys.home_see_more.tr(),
                      style: const TextStyle(
                        fontSize: AppConstants.kFontSizeM,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              ),
              ListView.builder(
                padding: const EdgeInsets.only(top: 10),
                itemCount: 4,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  List<Map<String, dynamic>> data = [
                    {
                      "title": "Kebakaran",
                      "description":
                          "Gedung A di gusur oleh warga karena menghalangi jalan",
                      "status": "Dalam Penanganan",
                      "img_url": [
                        Assets.images.img.path,
                        Assets.images.banner.path
                      ]
                    }
                  ];

                  return ReportCard(
                    data: data,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
