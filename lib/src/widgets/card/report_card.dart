// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:report_incident/src/config/constant.dart';
import 'package:report_incident/src/config/theme/colors.dart';
import 'package:report_incident/src/features/detail_list/view/detail_list_page.dart';

class ReportCard extends StatelessWidget {
  final List<Map<String, dynamic>> data;

  const ReportCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => pushDynamicScreen(
        context,
        screen: PageTransition(
            child: DetailListPage(
              data: data,
            ),
            type: PageTransitionType.bottomToTop),
      ),
      child: Container(
        padding: const EdgeInsets.all(6.0),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: UIColors.text.withOpacity(0.5),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                data[0]['img_url'][0],
                width: 97,
              ),
            ),
            const SizedBox(
              width: 15.0,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data[0]['title'],
                    style: const TextStyle(
                      fontSize: AppConstants.kFontSizeL,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 3.0,
                  ),
                  Flexible(
                    child: Text(
                      data[0]['description'],
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: AppConstants.kFontSizeS,
                        fontWeight: FontWeight.w300,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: AppColors.biru2,
                        ),
                        child: Text(
                          data[0]['status'],
                          style: const TextStyle(
                            fontSize: AppConstants.kFontSizeXS,
                            color: UIColors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
