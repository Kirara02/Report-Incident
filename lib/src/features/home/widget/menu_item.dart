// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:report_incident/src/config/theme/colors.dart';

class MenuItem extends StatelessWidget {
  final String title;
  final String icon;
  final Color color;
  final VoidCallback? onTap;
  const MenuItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.color,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(6.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: 1,
            color: UIColors.text.withOpacity(0.5),
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(icon),
            ),
            const SizedBox(
              width: 5.0,
            ),
            Text(title),
            const Spacer(),
            SvgPicture.asset(
              'assets/icons/chevron-right.svg',
              width: 24,
            )
          ],
        ),
      ),
    );
  }
}
