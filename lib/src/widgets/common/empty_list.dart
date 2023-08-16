import 'package:flutter/material.dart';
import 'package:report_incident/src/config/constant.dart';
import 'package:lottie/lottie.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({this.size = 40, this.title, super.key});
  final double? size;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            height: size,
            width: size,
            child: Lottie.asset("assets/lottie/notFound.json")),
        const SizedBox(height: 0),
        Text(
          title ?? '',
          maxLines: 2,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: AppConstants.kFontSizeL,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
